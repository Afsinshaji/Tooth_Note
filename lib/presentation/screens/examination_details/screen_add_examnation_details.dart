import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/examination_details/examination_details.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/screens/chief_complaints/screen_add_chief_complaints.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/add_notes_field.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class AddExaminationDetailsScreen extends StatefulWidget {
  const AddExaminationDetailsScreen(
      {super.key, this.isToEdit = false, this.index, this.text});
  final bool isToEdit;
  final int? index;
  final String? text;
  @override
  State<AddExaminationDetailsScreen> createState() =>
      _AddExaminationDetailsScreenState();
}

class _AddExaminationDetailsScreenState
    extends State<AddExaminationDetailsScreen> {
  final TextEditingController examinationDetailsController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.isToEdit == true) {
      examinationDetailsController.text = widget.text!;
    }
    super.initState();
  }

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
            'Add Examination Details',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                letterSpacing: .5,
                fontSize: size.width * 0.055,
                color: ToothNoteColors.kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    showPopup(context, size);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.03, right: size.width * 0.03),
                    width: size.width,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        color: ToothNoteColors.kWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  ToothNoteColors.kBlackColor.withOpacity(0.5),
                              spreadRadius: 0.01,
                              offset: const Offset(0.3, 1))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.01),
                        const Icon(Icons.date_range),
                        SizedBox(width: size.width * 0.28),
                        const TimeWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text('Examination Details',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.035,
                        color: ToothNoteColors.kBlackColor45,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                AddNotesTextField(
                    controller: examinationDetailsController, maxLines: 23),
                SizedBox(
                  height: size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomWidget(
          formKey: formKey,
          size: size,
          widget: widget,
          examinationDetailsController: examinationDetailsController),
    );
  }
}

class BottomWidget extends ConsumerWidget {
  const BottomWidget({
    super.key,
    required this.formKey,
    required this.size,
    required this.widget,
    required this.examinationDetailsController,
  });

  final GlobalKey<FormState> formKey;
  final Size size;
  final AddExaminationDetailsScreen widget;

  final TextEditingController examinationDetailsController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<PatientBloc, PatientState>(
      builder: (context, patientstate) {
        PatientsDetailsDTO? patient;
        if (patientstate is displayPatient) {
          patient = patientstate.patient;
        }
        return BottomSaveButton(
            formKey: formKey,
            size: size,
            onTap: () {
              if (formKey.currentState!.validate()) {
                if (patient != null) {
                  List<dynamic> examinationDetailsList = [];
                  ExaminationDetailsDTO? examinationDetailsDTO =
                      patient.examinationDetails;
                  if (examinationDetailsDTO != null) {
                    examinationDetailsList =
                        examinationDetailsDTO.examinationDetails;
                  }
                  if (widget.isToEdit == true) {
                    examinationDetailsList[widget.index!] = {
                      'value': examinationDetailsController.text,
                      'date': ref.watch(dateProvider),
                    };
                  } else {
                    examinationDetailsList.add({
                      'value': examinationDetailsController.text,
                      'date': ref.watch(dateProvider),
                    });
                  }

                  final newExaminationDetailsDTO = ExaminationDetailsDTO(
                      patientId: patient.patientId!,
                      examinationDetails: examinationDetailsList);

                  BlocProvider.of<PatientBloc>(context)
                      .add(PatientEvent.addPatient(
                          patient: PatientsDetailsDTO( newAppointment: patient.newAppointment,
                    payments: patient.payments,  dob: patient.dob,
                    patientName: patient.patientName,
                    patientNumber: patient.patientNumber,doctor: patient.doctor, medicine: patient.medicine,
                    address: patient.address,
                    phoneNumber: patient.phoneNumber,
                    age: patient.age,
                    sex: patient.sex,
                    date: patient.date,
                    chiefComplaints: patient.chiefComplaints,
                    diagnosis: patient.diagnosis,
                    drugAllergy: patient.drugAllergy,
                    drughistory: patient.drughistory,
                    labInvestigation: patient.labInvestigation,
                    examinationDetails: newExaminationDetailsDTO,
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
                }
              }
            });
      },
    );
  }
}
