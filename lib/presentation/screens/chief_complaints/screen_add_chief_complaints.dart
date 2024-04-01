import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/chief_complaints/chief_complaints.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/add_notes_field.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class AddChiefComplaintsScreen extends StatefulWidget {
  const AddChiefComplaintsScreen(
      {super.key, this.isToEdit = false, this.index, this.text});
  final bool isToEdit;
  final int? index;
  final String? text;
  @override
  State<AddChiefComplaintsScreen> createState() =>
      _AddChiefComplaintsScreenState();
}

class _AddChiefComplaintsScreenState extends State<AddChiefComplaintsScreen> {
  final TextEditingController chiefComplaintController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
      if (widget.isToEdit == true) {
      chiefComplaintController.text = widget.text!;
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
            'Add Chief Complaints',
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
              Text('Chief Complaint',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: size.width * 0.035,
                      color: ToothNoteColors.kBlackColor45,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              AddNotesTextField(
                  controller: chiefComplaintController, maxLines: 5),
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
      bottomSheet: BottomSheetButton(formKey: formKey, size: size, widget: widget, 
     
      chiefComplaintController: chiefComplaintController),
    );
  }
}

class BottomSheetButton extends ConsumerWidget {
  const BottomSheetButton({
    super.key,
    required this.formKey,
    required this.size,
    required this.widget,
   
   
    required this.chiefComplaintController,
  });

  final GlobalKey<FormState> formKey;
  final Size size;
  final AddChiefComplaintsScreen widget;
 
 
  final TextEditingController chiefComplaintController;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                  List<dynamic> chiefComplaintsList = [];
                  ChiefComplaintsDTO? chiefComplaintsDTO =
                      patient.chiefComplaints;
                  if (chiefComplaintsDTO != null) {
                    chiefComplaintsList = chiefComplaintsDTO.chiefComplaints;
                  }
                  if (widget.isToEdit == true) {
                    chiefComplaintsList[widget.index!] =
                     { 'value':  chiefComplaintController.text,'date':ref.watch(dateProvider),};
                  } else {
                    chiefComplaintsList.add({ 'value':chiefComplaintController.text,
                    'date':ref.watch(dateProvider),
                    });
                  }

                  final newChiefComplaintDTO = ChiefComplaintsDTO(
                      patientId: patient.patientId!,
                      chiefComplaints: chiefComplaintsList);

                  BlocProvider.of<PatientBloc>(context)
                      .add(PatientEvent.addPatient(
                          patient: PatientsDetailsDTO( 
                             newAppointment: patient.newAppointment,
                            payments: patient.payments,
                    patientName: patient.patientName,  dob: patient.dob,doctor: patient.doctor,
                    patientNumber: patient.patientNumber,
                    address: patient.address,
                    phoneNumber: patient.phoneNumber,
                    age: patient.age,
                    sex: patient.sex,
                    date: patient.date,
                    chiefComplaints: newChiefComplaintDTO, labInvestigation: patient.labInvestigation,
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
                }
              }
            });
      },
    );
  }
}

 Future<void> showPopup(
    BuildContext context,
    Size size,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
                width: size.width * 0.8,
                height: size.width * 0.8,
                child: const DatePickerWidget()));
      },
    );
  }