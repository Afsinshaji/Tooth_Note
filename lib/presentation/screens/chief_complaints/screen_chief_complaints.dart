import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/chief_complaints/chief_complaints.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/chief_complaints/screen_add_chief_complaints.dart';
import 'package:tooth_note/presentation/screens/treatment_planning/screen_treatment_planning.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/alert_box.dart';
import 'package:tooth_note/utilities/colors.dart';

class ChiefComplaintsScreen extends ConsumerWidget {
  const ChiefComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
            'Chief Complaints',
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
        onTap: () {
            initializeDate(ref);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddChiefComplaintsScreen(),
              ));
        },
        child: Container(
          height: size.width * 0.13,
          width: size.width * 0.13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ToothNoteColors.kBlackColor),
          child: Icon(
            Icons.add,
            color: ToothNoteColors.kWhiteColor,
            size: size.width * 0.1,
          ),
        ),
      ),
      backgroundColor: ToothNoteColors.kLightBluwWhite,
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, patientstate) {
          PatientsDetailsDTO? patient;
          if (patientstate is displayPatient) {
            patient = patientstate.patient;
          }
          if (patient == null ||
              patient.chiefComplaints == null ||
              patient.chiefComplaints!.chiefComplaints.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/sammy-shield-medical-protection (1).gif',
                width: size.width * 0.5,
              ),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              if (index == patient!.chiefComplaints!.chiefComplaints.length) {
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
            itemCount: patient.chiefComplaints!.chiefComplaints.length + 1,
          );
        },
      ),
    );
  }
}

class EachContainerBox extends ConsumerWidget {
  const EachContainerBox(
      {super.key,
      required this.size,
      required this.patient,
      required this.index});

  final Size size;
  final PatientsDetailsDTO? patient;
  final int index;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    DateTime? date;
    if (patient!.chiefComplaints!.chiefComplaints[index]['date'] is Timestamp) {
      date = patient!.chiefComplaints!.chiefComplaints[index]['date'].toDate();
    }

    return InkWell(
      onLongPress: () {
        showPopupMenu(context, size, patient!, index);
      },
      onTap: () {
         addTime(date??DateTime.now(), ref);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewScreen(
                  data: patient!.chiefComplaints!.chiefComplaints[index]
                      ['value'],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddChiefComplaintsScreen(
                            isToEdit: true,
                            index: index,
                            text: patient!.chiefComplaints!
                                .chiefComplaints[index]['value'],
                          ),
                        ));
                  }),
            ));
      },
      child: Container(
        margin: EdgeInsets.all(size.width * 0.025),
        width: size.width,
        height: size.height * 0.075,
        padding: EdgeInsets.symmetric(
            vertical: size.width * 0.05, horizontal: size.width * 0.05),
        decoration: BoxDecoration(
            // boxShadow: const [
            //   BoxShadow(
            //       color: ToothNoteColors.kBlackColor45,
            //       blurRadius: 3,
            //       offset: Offset(4, 4),
            //       spreadRadius: 2)
            // ],
            color: ToothNoteColors.kWhiteColor,
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.5,
              child: Text(
                // patient!.chiefComplaints!.chiefComplaints[index]['value'].toString().length>10?
                patient!.chiefComplaints!.chiefComplaints[index]['value'],
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    letterSpacing: .5,
                    fontSize: size.width * 0.045,
                    color: ToothNoteColors.kBlackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Text(
              date == null ? '' : "${date.day}/${date.month}/${date.year}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: size.width * 0.04,
                  color: ToothNoteColors.kBlackColor,
                  fontWeight: FontWeight.w400,
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
    if (value != null) {
      if (value == 1) {
        alertBox(context, 'Delete', () {
          List<dynamic> chiefComplaintsList = [];
          ChiefComplaintsDTO? chiefComplaintsDTO = patient.chiefComplaints;
          if (chiefComplaintsDTO != null) {
            chiefComplaintsList = chiefComplaintsDTO.chiefComplaints;
          }
          chiefComplaintsList.removeAt(index);
          final newChiefComplaintDTO = ChiefComplaintsDTO(
              patientId: patient.patientId!,
              chiefComplaints: chiefComplaintsList);
          BlocProvider.of<PatientBloc>(context).add(PatientEvent.addPatient(
              patient: PatientsDetailsDTO(  medicine: patient.medicine,
                 newAppointment: patient.newAppointment,
                payments: patient.payments,
              dob: patient.dob,doctor: patient.doctor,
            patientName: patient.patientName,
            patientNumber: patient.patientNumber,
            address: patient.address,
            phoneNumber: patient.phoneNumber,labInvestigation: patient.labInvestigation,
            age: patient.age,
            sex: patient.sex,
            date: patient.date,
            chiefComplaints: newChiefComplaintDTO,
            diagnosis: patient.diagnosis,
            drugAllergy: patient.drugAllergy,
            drughistory: patient.drughistory,
            examinationDetails: patient.examinationDetails,
            medicalHistory: patient.medicalHistory,
            pastDentalHistory: patient.pastDentalHistory,
            patientId: patient.patientId,
            points: patient.points,
            treatmentDetails: patient.treatmentDetails,
            treatmentPlanning: patient.treatmentPlanning,
          )));
          BlocProvider.of<AllPatientsBloc>(context)
              .add(const AllPatientsEvent.getPatientList());

          Navigator.pop(context);
        }, size);
      }
    }
  });
}
