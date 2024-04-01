import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/application/view_dto/treatment_details/treatment_details.dart';
import 'package:tooth_note/presentation/widgets/add_notes_field.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class TreatmentDetailsScreen extends StatefulWidget {
  const TreatmentDetailsScreen(
      {super.key,required this.text});
 
 
  final String text;
  @override
  State<TreatmentDetailsScreen> createState() =>
      _TreatmentDetailsScreenState();
}

class _TreatmentDetailsScreenState extends State<TreatmentDetailsScreen> {
  final TextEditingController treatmentController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    
      treatmentController.text = widget.text;
  
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
            'Treatment Details',
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
              Text('Treatment Details',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: size.width * 0.035,
                      color: ToothNoteColors.kBlackColor45,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              AddNotesTextField(
                  controller: treatmentController, maxLines: 5),
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
                    
                  

                    final newTreatmentDTO = TreatmentDetailsDTO(
                        patientId: patient.patientId!,
                        treatmentDetails: treatmentController.text);

                    BlocProvider.of<PatientBloc>(context)
                        .add(PatientEvent.addPatient(
                            patient: PatientsDetailsDTO(   payments: patient.payments, newAppointment: patient.newAppointment,
                      patientName: patient.patientName,
                      patientNumber: patient.patientNumber,  dob: patient.dob,
                      address: patient.address,
                      phoneNumber: patient.phoneNumber,doctor: patient.doctor,
                      age: patient.age,
                      sex: patient.sex, labInvestigation: patient.labInvestigation,
                      date: patient.date,
                      chiefComplaints: patient.chiefComplaints,
                      diagnosis: patient.diagnosis,
                      drugAllergy: patient.drugAllergy,
                      drughistory: patient.drughistory,
                      examinationDetails: patient.examinationDetails,
                      medicalHistory:patient.medicalHistory,
                      pastDentalHistory: patient.pastDentalHistory,
                      patientId: patient.patientId,
                      points: patient.points,
                      treatmentDetails: newTreatmentDTO,
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
