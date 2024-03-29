import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/application/view_dto/points/points.dart';
import 'package:tooth_note/presentation/widgets/add_notes_field.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class AddPointsScreen extends StatefulWidget {
  const AddPointsScreen(
      {super.key, this.isToEdit = false, this.index, this.text});
  final bool isToEdit;
  final int? index;
  final String? text;
  @override
  State<AddPointsScreen> createState() =>
      _AddPointsScreenState();
}

class _AddPointsScreenState extends State<AddPointsScreen> {
  final TextEditingController pointsController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
      if (widget.isToEdit == true) {
      pointsController.text = widget.text!;
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
            'Add Points',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                letterSpacing: .5,
                fontSize: size.width * 0.055,
                color: ToothNoteColors.kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Points',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: size.width * 0.035,
                      color: ToothNoteColors.kBlackColor45,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              AddNotesTextField(
                  controller: pointsController, maxLines: 5),
            ],
          ),
        ),
      ),
      bottomSheet: BlocBuilder<PatientBloc, PatientState>(
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
                    List<dynamic> pointsList = [];
                    PointsDTO? pointsDTO =
                        patient.points;
                    if (pointsDTO != null) {
                      pointsList = pointsDTO.points;
                    }
                    if (widget.isToEdit == true) {
                      pointsList[widget.index!] =
                          pointsController.text;
                    } else {
                      pointsList.add(pointsController.text);
                    }

                    final newPointsDTO = PointsDTO(
                        patientId: patient.patientId!,
                        points: pointsList);

                    BlocProvider.of<PatientBloc>(context)
                        .add(PatientEvent.addPatient(
                            patient: PatientsDetailsDTO(   payments: patient.payments,
                      patientName: patient.patientName,
                      patientNumber: patient.patientNumber,  dob: patient.dob,
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
                      medicalHistory:patient.medicalHistory,
                      pastDentalHistory: patient.pastDentalHistory,
                      patientId: patient.patientId, labInvestigation: patient.labInvestigation,
                      points: newPointsDTO,
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
      ),
    );
  }
}
