import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:open_file_plus/open_file_plus.dart';

// import 'package:flutter/material.dart' as mt;

Future<void> downloadPDF(File pdfFile) async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    status = await Permission.storage.request();
  }

  if (status.isGranted) {
    await _saveAndLaunchPDF(pdfFile); // Call the download function
  } else {
    // Handle permission denial (e.g., show a message to the user)
  }
}

Future<void> _saveAndLaunchPDF(File pdfFile) async {
  final directory =
      await getApplicationDocumentsDirectory(); // Or getDownloadsDirectory() for user-chosen location
  final path =
      '${directory.path}/${pdfFile.path.split('/').last}'; // Extract filename

  await pdfFile
      .writeAsBytes(await pdfFile.readAsBytes()); // Write the PDF content

  // Open the downloaded PDF (optional)

  try {
    log(path);
    await pdfFile.copy(path);
    await OpenFile.open(path).onError((error, stackTrace) {
      log(error.toString());
      return OpenResult();
    });
  } catch (e) {
    log(e.toString());
  }

  // Consider using a platform-specific launcher if necessary
}

Future<File> creatingpdf(Size size, PatientsDetailsDTO patient) async {
  late Uint8List data;
  data = await previewPdf(PdfColors.red, patient, size);
  // await savePdfFile(patient.patientId!, data);
  final output = await getTemporaryDirectory();
  final fileName =
      '${patient.patientNumber}-${DateTime.now().microsecondsSinceEpoch}';
  var filePath = "${output.path}/$fileName.pdf";
  final file = File(filePath);
  await file.writeAsBytes(data);

  //Here............
  // await OpenFile.open(filePath).onError((error, stackTrace) {
  //   log(error.toString());
  //   return OpenResult();
  // });
  //Here............
  return file;
}

// Future<void> savePdfFile(String fileName, Uint8List byteList) async {
//   final output = await getTemporaryDirectory();
//   var filePath = "${output.path}/$fileName.pdf";
//   final file = File(filePath);
//   await file.writeAsBytes(byteList);
//   await OpenDocument.openDocument(filePath: filePath);
// }

// Future<void> savePdfFile(String fileName, Uint8List byteList) async {
//   final output = await getTemporaryDirectory();
//   var filePath = "${output.path}/$fileName.pdf";
//   final file = File(filePath);
//   await file.writeAsBytes(byteList);
//   await OpenDocument.openDocument(filePath: filePath);
// }

Future<Uint8List> previewPdf(
    PdfColor previewBasecolor, PatientsDetailsDTO patient, Size size) async {
  final pdf = pw.Document();

  double fullWidth = 0.0;
  // pw.Widget subRow({required String field, required String amount}) {
  //   return pw.Container(
  //       width: fullWidth * 0.4,
  //       child: pw.Row(
  //           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //           children: [
  //             pw.Text(field, style: pw.TextStyle(fontSize: fullWidth * 0.028)),
  //             pw.Text(amount, style: pw.TextStyle(fontSize: fullWidth * 0.028)),
  //           ]));
  // }

  pw.Widget patientDetailsColumn(
      double fullHeight, String field, String value) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(field,
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: fullWidth * 0.035)),
          pw.SizedBox(height: fullHeight * 0.005),
          pw.Text(value, style: pw.TextStyle(fontSize: fullWidth * 0.03)),
        ]);
  }

  pw.Widget eachSegmentDetails(
      String segment, List<dynamic> segmentDetails, double fullHeight) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(segment,
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: fullWidth * 0.05)),
          pw.SizedBox(height: fullHeight * 0.01),
          pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: List.generate(segmentDetails.length, (index) {
                final segmentMap = segmentDetails[index];
                if (segmentMap is Map) {
                  log(segmentMap['value'].toString());
                }
                return pw.Text(
                    segmentMap is String
                        ? segmentMap
                        : segmentMap['value'].toString(),
                    style: pw.TextStyle(fontSize: fullWidth * 0.035));
              })),
        ]);
  }

  Uint8List imageBytes = await loadImageBytes(
      'assets/images/WhatsApp Image 2024-03-15 at 20.36.01.jpeg');

  Uint8List loadFont() {
    final fontData = File('').readAsBytesSync();
    return fontData.buffer.asUint8List();
  }

  pw.Paragraph _createParagraph(pw.Context context) {
    final data = loadFont();
    final font = pw.Font.ttf(ByteData(data.lengthInBytes));
    return pw.Paragraph(
      text: '',
      style: pw.TextStyle(font: font),
    );
  }

  void _addOverflowPage(pw.Document pdf, pw.Context context, String text) {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(child: pw.Text(text)),
      ),
    );
  }

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        fullWidth = context.page.pageFormat.width / 2;
        double fullHeight = context.page.pageFormat.height;
        return pw.Container(
            color: PdfColors.white,
            padding: pw.EdgeInsets.all(fullWidth * 0),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(children: [
                    pw.Image(
                        pw.MemoryImage(
                          imageBytes,
                        ),
                        width: fullWidth * 0.1),
                    pw.SizedBox(width: fullWidth * 0.05),
                    pw.Text('Divine Dental Clinic',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: fullWidth * 0.075))
                  ]),
                  pw.SizedBox(height: fullHeight * 0.01),
                  pw.Container(
                      width: fullWidth * 1.6,
                      height: fullHeight * 0.01,
                      decoration: pw.BoxDecoration(
                        color: previewBasecolor,
                      )),
                  pw.SizedBox(height: fullHeight * 0.01),
                  pw.Text('Patient Details',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: fullWidth * 0.05)),
                  pw.SizedBox(height: fullHeight * 0.01),
                  patientDetailsColumn(
                      fullHeight, 'Patient Name', patient.patientName),
                  pw.SizedBox(height: fullHeight * 0.007),
                  patientDetailsColumn(
                      fullHeight, 'Patient Number', patient.patientNumber),
                  pw.SizedBox(height: fullHeight * 0.007),
                  patientDetailsColumn(
                      fullHeight, 'Age', patient.age.toString()),
                  pw.SizedBox(height: fullHeight * 0.007),
                  patientDetailsColumn(fullHeight, 'Sex', patient.sex),
                  pw.SizedBox(height: fullHeight * 0.007),
                  patientDetailsColumn(fullHeight, 'Address', patient.address),
                  pw.SizedBox(height: fullHeight * 0.007),
                  patientDetailsColumn(
                      fullHeight, 'Phone Number', patient.phoneNumber),
                  pw.SizedBox(height: fullHeight * 0.007),
                  patientDetailsColumn(fullHeight, 'Date Added', patient.date),
                  pw.SizedBox(height: fullHeight * 0.01),
                  patient.chiefComplaints != null
                      ? eachSegmentDetails('Chief Complaints',
                          patient.chiefComplaints!.chiefComplaints, fullHeight)
                      : pw.SizedBox(),

                  pw.SizedBox(height: fullHeight * 0.01),
                  patient.drugAllergy != null
                      ? eachSegmentDetails('Drug Allergy',
                          [patient.drugAllergy!.drugAllergy], fullHeight)
                      : pw.SizedBox(),

                  pw.SizedBox(height: fullHeight * 0.01),
                  patient.diagnosis != null
                      ? eachSegmentDetails('Diagnosis',
                          [patient.diagnosis!.diagnosis], fullHeight)
                      : pw.SizedBox(),

                  pw.SizedBox(height: fullHeight * 0.01),
                  patient.treatmentDetails != null
                      ? eachSegmentDetails(
                          'Treatment Details',
                          [patient.treatmentDetails!.treatmentDetails],
                          fullHeight)
                      : pw.SizedBox(),
                  pw.SizedBox(height: fullHeight * 0.01),
                  // patient.points != null
                  //     ? eachSegmentDetails(
                  //         'Points', patient.points!.points, fullHeight)
                  //     : pw.SizedBox(),
                  // pw.SizedBox(height: fullHeight * 0.01),
                ])); // Center
      }));
  if (patient.medicalHistory != null &&
      patient.medicalHistory!.medicalHistory.isNotEmpty) {
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        fullWidth = context.page.pageFormat.width / 2;
        double fullHeight = context.page.pageFormat.height;
        return patient.medicalHistory != null
            ? eachSegmentDetails('Medical History',
                patient.medicalHistory!.medicalHistory, fullHeight)
            : pw.SizedBox();
      },
    ));
  }
  if (patient.pastDentalHistory != null &&
      patient.pastDentalHistory!.pastDentalHistory.isNotEmpty) {
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        fullWidth = context.page.pageFormat.width / 2;
        double fullHeight = context.page.pageFormat.height;
        return patient.pastDentalHistory != null
            ? eachSegmentDetails('Dental History',
                patient.pastDentalHistory!.pastDentalHistory, fullHeight)
            : pw.SizedBox();
      },
    ));
  }

  if (patient.drughistory != null &&
      patient.drughistory!.drugHistory.isNotEmpty) {
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        fullWidth = context.page.pageFormat.width / 2;
        double fullHeight = context.page.pageFormat.height;
        return patient.drughistory != null
            ? eachSegmentDetails(
                'Drug History', patient.drughistory!.drugHistory, fullHeight)
            : pw.SizedBox();
      },
    ));
  }
  if (patient.examinationDetails != null &&
      patient.examinationDetails!.examinationDetails.isNotEmpty) {
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        fullWidth = context.page.pageFormat.width / 2;
        double fullHeight = context.page.pageFormat.height;

// // Define the available height on the page
//         final availableHeight = fullHeight;

//       // Create a Paragraph with the provided text

//         // Layout the Paragraph to calculate its height
//         final paragraph = _createParagraph(context);
//           final layout = paragraph.estimateHeight(context);
//           final textHeight = layout.height;
//         // Check if the text exceeds the available height
//         if (textHeight > availableHeight) {
//           // Add a new page
//           pdf.addPage(
//             pw.Page(
//               build: (pw.Context context) {
//                 // Write the text on the new page
//                 return pw.Center(child: pw.Text(text));
//               },
//             ),
//           );
//         }

        return patient.examinationDetails != null
            ? eachSegmentDetails('Examination Details',
                patient.examinationDetails!.examinationDetails, fullHeight)
            : pw.SizedBox();
      },
    ));
  }
  if (patient.treatmentPlanning != null &&
      patient.treatmentPlanning!.treatmentPlanning.isNotEmpty) {
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        fullWidth = context.page.pageFormat.width / 2;
        double fullHeight = context.page.pageFormat.height;
        return patient.treatmentPlanning != null
            ? eachSegmentDetails('Treatment Planning',
                patient.treatmentPlanning!.treatmentPlanning, fullHeight)
            : pw.SizedBox();
      },
    ));
  }

  return pdf.save(); // Page
}

// class PreviewScreen extends StatelessWidget {
//   const PreviewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//         final Size size = MediaQuery.of(context).size;
//     return const Placeholder();
//   }
// }

Future<Uint8List> loadImageBytes(String imagePath) async {
  // Load the image file from assets
  final ByteData data = await rootBundle.load(imagePath);

  // Convert the ByteData to Uint8List
  Uint8List bytes = data.buffer.asUint8List();

  return bytes;
}
