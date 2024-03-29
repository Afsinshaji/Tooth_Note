import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/lab_investigation/screen_add_file.dart';

import 'package:tooth_note/utilities/colors.dart';

class LabInvestigationScreen extends StatelessWidget {
  const LabInvestigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ToothNoteColors.backgroundColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ToothNoteColors.kWhiteColor,
              )),
          title: Text(
            'Lab Investigation',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                letterSpacing: .5,
                fontSize: size.width * 0.055,
                color: ToothNoteColors.kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      floatingActionButton: InkWell(
        onTap: () async {
          await FilePicker.platform.pickFiles().then((result) {
            if (result != null) {
              File file = File(result.files.single.path!);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFilesScreen(
                        file: file,
                        fileExtension: result.files.single.extension ?? ''),
                  ));
            }

            return;
          });
        },
        child: Container(
          height: size.width * 0.13,
          width: size.width * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ToothNoteColors.kBlackColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: ToothNoteColors.kWhiteColor,
                size: size.width * 0.055,
              ),
              Text(
                'Upload Image',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: size.width * 0.04,
                    color: ToothNoteColors.kWhiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, patientstate) {
          PatientsDetailsDTO? patient;
          if (patientstate is displayPatient) {
            if (patientstate.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ToothNoteColors.backgroundColor,
                ),
              );
            }
            patient = patientstate.patient;
          }

          if (patient == null ||
              patient.labInvestigation == null ||
              patient.labInvestigation!.labInvestigation.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/sammy-shield-medical-protection (1).gif',
                width: size.width * 0.5,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index == patient!.labInvestigation!.labInvestigation.length) {
                return SizedBox(
                  height: size.width * 0.18,
                );
              }
              return EachContainerBox(
                size: size,
                patient: patient,
                index: index,
              );
            },
            itemCount: patient.labInvestigation!.labInvestigation.length + 1,
          );
        },
      ),
      backgroundColor: ToothNoteColors.kLightBluwWhite,
    );
  }
}

class EachContainerBox extends StatelessWidget {
  const EachContainerBox(
      {super.key,
      required this.size,
      required this.patient,
      required this.index});

  final Size size;
  final PatientsDetailsDTO? patient;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showPopupMenu(context, size, patient!, index);
      },
      onTap: () {
        // launchFile(patient!.labInvestigation!.labInvestigation[index]['url']);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDisplayScreen(
                  name: patient!.labInvestigation!.labInvestigation[index]
                      ['name'],
                  downloadUrl: patient!
                      .labInvestigation!.labInvestigation[index]['url']),
            ));
      },
      child: Container(
        margin: EdgeInsets.all(size.width * 0.025),
        width: size.width,
        //  height: size.height * 0.075,
        padding: EdgeInsets.symmetric(
            vertical: size.width * 0.05, horizontal: size.width * 0.05),

        decoration: BoxDecoration(
            boxShadow: const [
              // BoxShadow(
              //     color: ToothNoteColors.kBlackColor45,
              //     blurRadius: 3,
              //     offset: Offset(4, 4),
              //     spreadRadius: 2)
            ],
            color: ToothNoteColors.kWhiteColor,
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.image,
              color: ToothNoteColors.backgroundColor,
              size: size.width * 0.08,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Text(
              patient!.labInvestigation!.labInvestigation[index]['name'],
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  letterSpacing: .5,
                  fontSize: size.width * 0.045,
                  color: ToothNoteColors.kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showPopupMenu(
    BuildContext context, Size size, PatientsDetailsDTO patient, int index) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RenderBox button = context.findRenderObject() as RenderBox;

  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(button.size.topRight(Offset.zero),
          ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  showMenu(
    color: ToothNoteColors.backgroundColor,
    context: context,
    position: position,
    items: [
      PopupMenuItem(
        value: 1,
        child: Row(
          children: [
            const Icon(
              Icons.delete,
              color: ToothNoteColors.kWhiteColor,
            ),
            Text(
              'delete',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  letterSpacing: .5,
                  color: ToothNoteColors.kWhiteColor.withOpacity(0.9),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  ).then((value) {
    // if (value != null) {
    //   if (value == 1) {
    //     alertBox(context, 'Delete', () {
    //       List<dynamic> pointsList = [];
    //       PointsDTO? pointsDTO = patient.points;
    //       if (pointsDTO != null) {
    //         pointsList = pointsDTO.points;
    //       }
    //       pointsList.removeAt(index);
    //       final newPointsDTO =
    //           PointsDTO(patientId: patient.patientId!, points: pointsList);
    //       BlocProvider.of<PatientBloc>(context).add(PatientEvent.addPatient(
    //           patient: PatientsDetailsDTO(
    //                payments: patient.payments,
    //         patientName: patient.patientName,
    //         patientNumber: patient.patientNumber,
    //         address: patient.address,
    //         phoneNumber: patient.phoneNumber,
    //         age: patient.age,
    //         sex: patient.sex,
    //         date: patient.date,
    //         chiefComplaints: patient.chiefComplaints,
    //         diagnosis: patient.diagnosis,
    //         drugAllergy: patient.drugAllergy,
    //         drughistory: patient.drughistory,
    //         examinationDetails: patient.examinationDetails,
    //         medicalHistory: patient.medicalHistory,
    //         pastDentalHistory: patient.pastDentalHistory,
    //         patientId: patient.patientId,
    //         points: newPointsDTO,
    //         treatmentDetails: patient.treatmentDetails,
    //         treatmentPlanning: patient.treatmentPlanning,
    //       )));
    //       BlocProvider.of<AllPatientsBloc>(context)
    //           .add(const AllPatientsEvent.getPatientList());

    //       Navigator.pop(context);
    //     }, size);
    //   }
    // }
  });
}

class ImageDisplayScreen extends StatelessWidget {
  const ImageDisplayScreen({
    super.key,
    required this.downloadUrl,
    required this.name,
  });
  final String downloadUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ToothNoteColors.backgroundColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ToothNoteColors.kWhiteColor,
              )),
          title: Text(
            name,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                letterSpacing: .5,
                fontSize: size.width * 0.055,
                color: ToothNoteColors.kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Image.network(downloadUrl),
        ),
      )),
    );
  }
}
