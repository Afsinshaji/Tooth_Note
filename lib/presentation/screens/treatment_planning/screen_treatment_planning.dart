import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/application/view_dto/treatment_planning/tretment_planning.dart';
import 'package:tooth_note/presentation/screens/treatment_planning/screen_add_treatment_planning.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/alert_box.dart';
import 'package:tooth_note/utilities/colors.dart';

class TreatmentPlanningScreen extends ConsumerWidget {
  const TreatmentPlanningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            'Treatment Planning',
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
                builder: (context) => const AddTreatmentPlanningScreen(),
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
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, patientstate) {
          PatientsDetailsDTO? patient;
          if (patientstate is displayPatient) {
            patient = patientstate.patient;
          }
          if (patient == null ||
              patient.treatmentPlanning == null ||
              patient.treatmentPlanning!.treatmentPlanning.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/sammy-shield-medical-protection (1).gif',
                width: size.width * 0.5,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index ==
                  patient!.treatmentPlanning!.treatmentPlanning.length) {
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
            itemCount: patient.treatmentPlanning!.treatmentPlanning.length + 1,
          );
        },
      ),
      backgroundColor: ToothNoteColors.kLightBluwWhite,
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
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime? date;
    if (patient!.treatmentPlanning!.treatmentPlanning[index]['date']
        is Timestamp) {
      date =
          patient!.treatmentPlanning!.treatmentPlanning[index]['date'].toDate();
    }
    return InkWell(
      onLongPress: () {
        showPopupMenu(context, size, patient!, index);
      },
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewScreen(
                  data: patient!.treatmentPlanning!.treatmentPlanning[index]
                      ['value'],
                  onTap: () {
                    addTime(date ?? DateTime.now(), ref);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTreatmentPlanningScreen(
                            isToEdit: true,
                            index: index,
                            text: patient!.treatmentPlanning!
                                .treatmentPlanning[index]['value'],
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
                patient!.treatmentPlanning!.treatmentPlanning[index]['value'],
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    letterSpacing: .5,
                    fontSize: size.width * 0.045,
                    color: ToothNoteColors.kBlackColor,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
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

class ViewScreen extends StatelessWidget {
  const ViewScreen({
    super.key,
    required this.data,
    required this.onTap,this.title= 'View',
  });
  final String data;
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToothNoteColors.backgroundColor,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              letterSpacing: .5,
              fontSize: size.width * 0.055,
              color: ToothNoteColors.kWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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
                onTap();
              },
              icon: const Icon(
                Icons.edit,
                color: ToothNoteColors.kWhiteColor,
              ))
        ],
      ),
      backgroundColor: ToothNoteColors.kLightBluwWhite,
      body: SingleChildScrollView(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: ColoredBox(
              color: ToothNoteColors.kWhiteColor,
              child: SizedBox(
                width: size.width,
                // height: size.height,
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Text(
                    data,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: size.width * 0.045,
                        color: ToothNoteColors.kBlackColor,
                        fontWeight: FontWeight.w500,
                        //  overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
          List<dynamic> treatmentPlanningList = [];
          TreatmentPlanningDTO? treatmentPlanningDTO =
              patient.treatmentPlanning;
          if (treatmentPlanningDTO != null) {
            treatmentPlanningList = treatmentPlanningDTO.treatmentPlanning;
          }
          treatmentPlanningList.removeAt(index);
          final newTreatmentPlanningDTO = TreatmentPlanningDTO(
              patientId: patient.patientId!,
              treatmentPlanning: treatmentPlanningList);
          BlocProvider.of<PatientBloc>(context).add(PatientEvent.addPatient(
              patient: PatientsDetailsDTO(
            newAppointment: patient.newAppointment,
            payments: patient.payments,
            patientName: patient.patientName,doctor: patient.doctor,
            patientNumber: patient.patientNumber,
            dob: patient.dob,
            address: patient.address,
            phoneNumber: patient.phoneNumber,
            age: patient.age,
            sex: patient.sex,
            date: patient.date,
            chiefComplaints: patient.chiefComplaints,
            diagnosis: patient.diagnosis,
            drugAllergy: patient.drugAllergy,
            drughistory: patient.drughistory,
            examinationDetails: patient.examinationDetails,
            medicalHistory: patient.medicalHistory,
            pastDentalHistory: patient.pastDentalHistory,
            patientId: patient.patientId,
            points: patient.points,
            labInvestigation: patient.labInvestigation,
            treatmentDetails: patient.treatmentDetails,
            treatmentPlanning: newTreatmentPlanningDTO,
          )));
          BlocProvider.of<AllPatientsBloc>(context)
              .add(const AllPatientsEvent.getPatientList());

          Navigator.pop(context);
        }, size);
      }
    }
  });
}
