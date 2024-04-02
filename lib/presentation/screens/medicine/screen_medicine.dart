import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/medicine/medicine.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/widgets/add_notes_field.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen(
      {super.key,required this.text});
 
 
  final String text;
  @override
  State<MedicineScreen> createState() =>
      _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final TextEditingController medicineController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    
      medicineController.text = widget.text;
  
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
            'Medicine',
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
              Text('Medicine',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: size.width * 0.035,
                      color: ToothNoteColors.kBlackColor45,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              AddNotesTextField(
                  controller: medicineController, maxLines: 5),
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
                    
                  

                    final newMedicineDTO = MedicineDTO(
                        patientId: patient.patientId!,
                        medicine: medicineController.text);

                    BlocProvider.of<PatientBloc>(context)
                        .add(PatientEvent.addPatient(
                            patient: PatientsDetailsDTO(   payments: patient.payments, newAppointment: patient.newAppointment,
                      patientName: patient.patientName, medicine: newMedicineDTO,
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
