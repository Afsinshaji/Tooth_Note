import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/application/view_dto/treatment_planning/tretment_planning.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/screens/chief_complaints/screen_add_chief_complaints.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/add_notes_field.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class AddTreatmentPlanningScreen extends StatefulWidget {
  const AddTreatmentPlanningScreen(
      {super.key, this.isToEdit = false, this.index, this.text});
  final bool isToEdit;
  final int? index;
  final String? text;
  @override
  State<AddTreatmentPlanningScreen> createState() =>
      _AddTreatmentPlanningScreenState();
}

class _AddTreatmentPlanningScreenState extends State<AddTreatmentPlanningScreen> {
  final TextEditingController treatmentPlanningController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
      if (widget.isToEdit == true) {
      treatmentPlanningController.text = widget.text!;
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
            'Add Treatment Planning',
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
              Text('Treatment Planning',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: size.width * 0.035,
                      color: ToothNoteColors.kBlackColor45,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              AddNotesTextField(
                  controller: treatmentPlanningController, maxLines: 5),
                       SizedBox(
                height: size.height * 0.03,
              ),
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
            ],
          ),
        ),
      ),
      bottomSheet: BottomWidget(formKey: formKey, size: size, widget: widget,  treatmentPlanningController: treatmentPlanningController),
    );
  }
}

class BottomWidget extends ConsumerWidget {
  const BottomWidget({
    super.key,
    required this.formKey,
    required this.size,
    required this.widget,
  
    required this.treatmentPlanningController,
  });

  final GlobalKey<FormState> formKey;
  final Size size;
  final AddTreatmentPlanningScreen widget;

  final TextEditingController treatmentPlanningController;

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
                  List<dynamic> treatmentPlanningList = [];
                  TreatmentPlanningDTO? treatmentPlanningDTO =
                      patient.treatmentPlanning;
                  if (treatmentPlanningDTO != null) {
                    treatmentPlanningList = treatmentPlanningDTO.treatmentPlanning;
                  }
                  if (widget.isToEdit == true) {
                    treatmentPlanningList[widget.index!] =
                       {'value': treatmentPlanningController.text,'date':ref.watch(dateProvider),};
                  } else {
                    treatmentPlanningList.add( {'value': treatmentPlanningController.text,'date':ref.watch(dateProvider),});
                  }

                  final newTreatmentPlanningDTO = TreatmentPlanningDTO(
                      patientId: patient.patientId!,
                      treatmentPlanning: treatmentPlanningList);

                  BlocProvider.of<PatientBloc>(context)
                      .add(PatientEvent.addPatient(
                          patient: PatientsDetailsDTO( newAppointment: patient.newAppointment,
                            payments: patient.payments,
                    patientName: patient.patientName,
                    patientNumber: patient.patientNumber,  dob: patient.dob,
                    address: patient.address,doctor: patient.doctor,
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
                    patientId: patient.patientId,
                    points: patient.points,
                    treatmentDetails: patient.treatmentDetails,
                    treatmentPlanning: newTreatmentPlanningDTO,
                    labInvestigation: patient.labInvestigation,
                  
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
