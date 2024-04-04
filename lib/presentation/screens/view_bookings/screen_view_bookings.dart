import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_bookings/all_bookings_bloc.dart';
import 'package:tooth_note/application/bookings/bookings_bloc.dart';

import 'package:tooth_note/application/view_dto/booking/booking.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_booking/screen_add_booking.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/alert_box.dart';
import 'package:tooth_note/utilities/Colors.dart';

class ViewBookingScreen extends ConsumerWidget {
  const ViewBookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    BookingsDTO? patientDTO;
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, patientstate) {
        if (patientstate is displayPatient) {
          patientDTO = patientstate.patient;
        }
        if (patientDTO == null) {
          return const Text('Empty');
        }

        final date = DateTime.parse(patientDTO!.date);

        return Scaffold(
          bottomSheet: InkWell(
            onTap: (){
       Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                       AddPatientScreen(
                                       isToRegister: true,
                                       patientName: patientDTO!.patientName,
                                       patientAddress: patientDTO!.address,
                                       patientId: patientDTO!.patientId,
                                    
                                      ),
                                ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.width * 0.015, horizontal: size.width * 0.01),
              height: size.height * 0.075,
              width: size.width,
              decoration: BoxDecoration(
                  color: ToothNoteColors.backgroundColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                'Register Patient >',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    letterSpacing: .5,
                    fontSize: size.width * 0.04,
                    color: ToothNoteColors.kWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
            ),
          ),
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
              actions: [
                IconButton(
                    onPressed: () {
                      alertBox(context, 'Delete', () {
                        BlocProvider.of<BookingsBloc>(context).add(
                            BookingsEvent.deleteBookingsPatientDetail(
                                patientId: patientDTO!.patientId));
                        BlocProvider.of<AllBookingsBloc>(context)
                            .add(const AllBookingsEvent.getBookedPatientList());

                        Navigator.pop(context);
                        Navigator.pop(context);
                      }, size);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: ToothNoteColors.kWhiteColor,
                    ))
              ],
              titleSpacing: 0,
              title: Text(
                'Booked Patient Information',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: size.width * 0.05,
                    color: ToothNoteColors.kWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    Container(
                      height: size.height * 0.1,
                      width: size.width,
                      color: ToothNoteColors.backgroundColor,
                      alignment: Alignment.center,
                      child: Text(
                        patientDTO!.patientName.isEmpty
                            ? 'Nil'
                            : patientDTO!.patientName,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: size.width * 0.05,
                            color: ToothNoteColors.kWhiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: size.width * 0.1,
                        left: size.width * 0.1,
                        child: Material(
                          shadowColor: ToothNoteColors.kBlackColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15)),
                          color: ToothNoteColors.kWhiteColor,
                          child: SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // IconButton(
                                //     onPressed: () async {
                                //       final url = Uri.parse(
                                //           "tel:${patientDTO!.phoneNumber}");
                                //       if (await canLaunchUrl(url)) {
                                //         await launchUrl(url);
                                //       } else {
                                //         throw 'Could not launch $url';
                                //       }
                                //     },
                                //     icon: const Icon(Icons.call)),
                                EditButton(patientDTO: patientDTO),
                                // FutureBuilder(
                                //     future: creatingpdf(size, patientDTO!),
                                //     builder: (context, filesnap) {
                                //       return IconButton(
                                //           onPressed: () async {
                                //             if (filesnap.hasData) {
                                //               Share.shareXFiles(
                                //                   [XFile(filesnap.data!.path)],
                                //                   text: patientDTO!.patientName,
                                //                   subject: 'Patient File',
                                //                   sharePositionOrigin:
                                //                       Rect.fromPoints(
                                //                           Offset.zero,
                                //                           Offset.zero));
                                //             }

                                //             // await creatingpdf(size, patientDTO!);
                                //           },
                                //           icon: const Icon(Icons.download));
                                //     }),
                                // InkWell(
                                //   onTap: () {
                                //     ////here
                                //     initializeDate(ref);
                                //     Navigator.push(
                                //         context,
                                //         CupertinoPageRoute(
                                //           builder: (context) =>
                                //               const MessageScreen(),
                                //         ));
                                //   },
                                //   child: Image.asset(
                                //     'assets/images/whatsapp-icon-2040x2048-8b5th74o.png',
                                //     width: size.width * 0.08,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FielAndValueText(
                              size: size,
                              field: 'Time Slot',
                              value: patientDTO!.timeSlot.isEmpty
                                  ? 'Nil'
                                  : patientDTO!.timeSlot),
                          SizedBox(width: size.width * 0.25),
                          FielAndValueText(
                              size: size,
                              field: 'Booked Date',
                              value: patientDTO!.date.isEmpty
                                  ? 'Nil'
                                  : "${date.day} - ${date.month} - ${date.year}"),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        children: [
                          FielAndValueText(
                              size: size,
                              field: 'pH Number',
                              value: patientDTO!.phNumber.isEmpty
                                  ? 'Nil'
                                  : patientDTO!.phNumber.toString()),
                          SizedBox(width: size.width * 0.35),
                          SizedBox(
                            width: size.width * 0.3,
                            child: FielAndValueText(
                                size: size,
                                field: 'Address',
                                value: patientDTO!.address.isEmpty
                                    ? 'Nil'
                                    : patientDTO!.address),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FielAndValueText(
                              size: size,
                              field: 'Procedure',
                              value: patientDTO!.procedure.isEmpty
                                  ? 'Nil'
                                  : patientDTO!.procedure),
                        ],
                      ),

                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.chiefComplaints != null &&
                      //         patientDTO!
                      //             .chiefComplaints!.chiefComplaints.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                            // Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //       builder: (context) =>
                            //           const ChiefComplaintsScreen(),
                            //     ));
                      //     },
                      //     prefixIcon: Icons.medical_information,
                      //     subtitle: 'Add Chief Complaints',
                      //     title: 'Chief Complaints'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.medicalHistory != null &&
                      //         patientDTO!
                      //             .medicalHistory!.medicalHistory.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 const MedicalHistoryScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.punch_clock,
                      //     subtitle: 'Add Patient Medical History',
                      //     title: 'Medical History'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.pastDentalHistory != null &&
                      //         patientDTO!.pastDentalHistory!.pastDentalHistory
                      //             .isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 const DentalHistoryScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.health_and_safety_sharp,
                      //     subtitle: 'Add Past Dental History',
                      //     title: 'Dental History'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.drugAllergy != null &&
                      //         patientDTO!.drugAllergy!.drugAllergy.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       String allergy = '';
                      //       if (patientDTO!.drugAllergy != null) {
                      //         allergy = patientDTO!.drugAllergy!.drugAllergy;
                      //       }
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 DrugAllergyScreen(text: allergy),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.radio_button_checked,
                      //     subtitle: 'Add Drug Allergies',
                      //     title: 'Drug Allergy'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.drughistory != null &&
                      //         patientDTO!.drughistory!.drugHistory.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 const DrugHistoryScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.history,
                      //     subtitle: 'Add Drug History',
                      //     title: 'Drug History'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.examinationDetails != null &&
                      //         patientDTO!.examinationDetails!.examinationDetails
                      //             .isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 const ExaminationDetailsScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.check_box,
                      //     subtitle: 'Add Examination Details',
                      //     title: 'Examination Details'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.labInvestigation != null &&
                      //         patientDTO!.labInvestigation!.labInvestigation
                      //             .isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 const LabInvestigationScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.science,
                      //     subtitle: 'Add Lab Results',
                      //     title: 'Lab Investigation'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.diagnosis != null &&
                      //         patientDTO!.diagnosis!.diagnosis.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       String diagnosis = '';
                      //       if (patientDTO!.diagnosis != null) {
                      //         diagnosis = patientDTO!.diagnosis!.diagnosis;
                      //       }
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 DiagnosisScreen(text: diagnosis),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.search,
                      //     subtitle: 'Add Diagnosis Details',
                      //     title: 'Diagnosis'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.treatmentPlanning != null &&
                      //         patientDTO!.treatmentPlanning!.treatmentPlanning
                      //             .isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 const TreatmentPlanningScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.add_chart,
                      //     subtitle: 'Add Treatment Plans',
                      //     title: 'Treatment Planning'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.treatmentDetails != null &&
                      //         patientDTO!.treatmentDetails!.treatmentDetails
                      //             .isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       String treatment = '';
                      //       if (patientDTO!.treatmentDetails != null) {
                      //         treatment = patientDTO!
                      //             .treatmentDetails!.treatmentDetails;
                      //       }
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 TreatmentDetailsScreen(text: treatment),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.medical_services_outlined,
                      //     subtitle: 'Add Treatment Details',
                      //     title: 'Treatment Details'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.medicine != null &&
                      //         patientDTO!.medicine!.medicine.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       String medicine = '';
                      //       if (patientDTO!.medicine != null) {
                      //         medicine = patientDTO!.medicine!.medicine;
                      //       }
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 MedicineScreen(text: medicine),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.medication,
                      //     subtitle: 'Add Medicine Details',
                      //     title: 'Medicine'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.newAppointment != null &&
                      //         patientDTO!
                      //             .newAppointment!.newAppointment.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) =>
                      //                 const NewAppointmentScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.table_chart,
                      //     subtitle: 'Add New Appointment',
                      //     title: 'New Appointment'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.payments != null &&
                      //         patientDTO!.payments!.payments.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) => const PaymentsScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.currency_rupee,
                      //     subtitle: 'Add Payments & due',
                      //     title: 'Payments'),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Detailscontainer(
                      //     isChecked: patientDTO!.points != null &&
                      //         patientDTO!.points!.points.isNotEmpty,
                      //     onTap: () {
                      //       initializeDate(ref);
                      //       Navigator.push(
                      //           context,
                      //           CupertinoPageRoute(
                      //             builder: (context) => const PointsScreen(),
                      //           ));
                      //     },
                      //     prefixIcon: Icons.book,
                      //     subtitle: 'Add Points To Remember',
                      //     title: 'Points'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  int calculateAge(DateTime dob) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - dob.year;
    int month1 = currentDate.month;
    int month2 = dob.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = dob.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}

class EditButton extends ConsumerWidget {
  const EditButton({
    super.key,
    required this.patientDTO,
  });

  final BookingsDTO? patientDTO;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          addTime(DateTime.parse(patientDTO!.date), ref);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddBookingScreen(
                  isToEdit: true,
                  patinetEditDTO: patientDTO,
                ),
              ));
        },
        icon: const Icon(Icons.edit));
  }
}

// class Detailscontainer extends StatelessWidget {
//   const Detailscontainer(
//       {super.key,
//       required this.prefixIcon,
//       required this.title,
//       required this.subtitle,
//       this.onTap,
//       required this.isChecked});
//   final IconData prefixIcon;
//   final String title;
//   final String subtitle;
//   final Function()? onTap;
//   final bool isChecked;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Material(
//         shadowColor: ToothNoteColors.kBlackColor,
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadiusDirectional.circular(5)),
//         color: ToothNoteColors.kWhiteColor,
//         child: InkWell(
//           onTap: onTap,
//           child: SizedBox(
//               height: size.height * 0.1,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
//                 child: Row(
//                   children: [
//                     Icon(
//                       prefixIcon,
//                       color: ToothNoteColors.backgroundColor,
//                       size: size.width * 0.13,
//                     ),
//                     SizedBox(
//                       width: size.width * 0.05,
//                     ),
//                     SizedBox(
//                       width: size.width * 0.48,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             title,
//                             style: GoogleFonts.poppins(
//                               textStyle: TextStyle(
//                                 fontSize: size.width * 0.045,
//                                 color: ToothNoteColors.kBlackColor,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.005,
//                           ),
//                           Text(
//                             subtitle,
//                             style: GoogleFonts.poppins(
//                               textStyle: TextStyle(
//                                 fontSize: size.width * 0.03,
//                                 color: ToothNoteColors.kBlackColor
//                                     .withOpacity(0.6),
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // SizedBox(
//                     //   width: size.width * 0.02,
//                     // ),
//                     isChecked
//                         ? Icon(
//                             Icons.check_box,
//                             color: ToothNoteColors.kGreenColor,
//                             size: size.width * 0.09,
//                           )
//                         : SizedBox(
//                             width: size.width * 0.06,
//                           ),
//                     SizedBox(
//                       width: size.width * 0.04,
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: ToothNoteColors.backgroundColor,
//                       size: size.width * 0.07,
//                     ),
//                   ],
//                 ),
//               )),
//         ));
//   }
// }

class FielAndValueText extends StatelessWidget {
  const FielAndValueText({
    super.key,
    required this.size,
    required this.field,
    required this.value,
  });

  final Size size;
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: size.width * 0.04,
              color: ToothNoteColors.kBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.005,
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: size.width * 0.04,
              color: ToothNoteColors.kBlackColor.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.005,
        ),
      ],
    );
  }
}
