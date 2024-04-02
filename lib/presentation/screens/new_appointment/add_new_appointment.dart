import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/new_appointment/new_appointment.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/screens/chief_complaints/screen_add_chief_complaints.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/add_notes_field.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class AddNewApponitmentScreen extends StatefulWidget {
  const AddNewApponitmentScreen(
      {super.key,
      this.isToEdit = false,
      this.index,
      this.text,
      this.attendance});
  final bool isToEdit;
  final int? index;
  final String? text;
  final String? attendance;
  @override
  State<AddNewApponitmentScreen> createState() =>
      _AddNewApponitmentScreenState();
}

class _AddNewApponitmentScreenState extends State<AddNewApponitmentScreen> {
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController appointmentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.isToEdit == true) {
      commentsController.text = widget.text!;
      log(widget.attendance.toString());
      appointmentController.text = widget.attendance!;
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
            'Add New Appointment',
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
                Text('Appointment Date',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.035,
                        color: ToothNoteColors.kBlackColor45,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
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
                              color: ToothNoteColors.kBlackColor.withOpacity(0.5),
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
                Text('Attended',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.035,
                        color: ToothNoteColors.kBlackColor45,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                AddNotesTextField(
                  controller: appointmentController,
                  maxLines: 1,
                  isAttended: true,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text('Comments',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.035,
                        color: ToothNoteColors.kBlackColor45,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                AddNotesTextField(controller: commentsController, maxLines: 5),
                SizedBox(
                  height: size.height * 0.3,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomWidget(
          attendanceController: appointmentController,
          formKey: formKey,
          size: size,
          widget: widget,
          commentsController: commentsController),
    );
  }
}

class BottomWidget extends ConsumerWidget {
  const BottomWidget(
      {super.key,
      required this.formKey,
      required this.size,
      required this.widget,
      required this.commentsController,
      required this.attendanceController});

  final GlobalKey<FormState> formKey;
  final Size size;
  final AddNewApponitmentScreen widget;

  final TextEditingController commentsController;
  final TextEditingController attendanceController;
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
                  List<dynamic> newAppointmentList = [];
                  NewAppointmentDTO? newAppointmentDTO = patient.newAppointment;
                  if (newAppointmentDTO != null) {
                    newAppointmentList = newAppointmentDTO.newAppointment;
                  }
                  if (widget.isToEdit == true) {
                    newAppointmentList[widget.index!] = {
                      'comment': commentsController.text,
                      'date': ref.watch(dateProvider),
                      'attended': attendanceController.text,
                    };
                  } else {
                    newAppointmentList.add({
                      'comment': commentsController.text,
                      'date': ref.watch(dateProvider),
                      'attended': attendanceController.text,
                    });
                  }

                  final newNewAppointmentDTO = NewAppointmentDTO(
                      patientId: patient.patientId!,
                      newAppointment: newAppointmentList);

                  BlocProvider.of<PatientBloc>(context)
                      .add(PatientEvent.addPatient(
                          patient: PatientsDetailsDTO(
                    payments: patient.payments, medicine: patient.medicine,
                    newAppointment: newNewAppointmentDTO,doctor: patient.doctor,
                    patientName: patient.patientName,
                    dob: patient.dob,
                    patientNumber: patient.patientNumber,
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
                    labInvestigation: patient.labInvestigation,
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
