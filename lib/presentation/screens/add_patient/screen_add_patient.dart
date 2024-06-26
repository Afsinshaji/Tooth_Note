import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_bookings/all_bookings_bloc.dart';

import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/bookings/bookings_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_patient/widgets/add_textfield.dart';
import 'package:tooth_note/presentation/screens/patients/screen_patients.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/utilities/colors.dart';
import 'package:tooth_note/utilities/list.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen(
      {super.key,
      this.isToEdit = false,
      this.patinetEditDTO,
      this.isToRegister = false,
      this.patientAddress = '',
      this.patientName = '',
      this.patientId = ''});
  final bool isToEdit;
  final PatientsDetailsDTO? patinetEditDTO;
  final bool isToRegister;
  final String patientName;
  final String patientAddress;
  final String patientId;

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController patientNumController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController docController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.isToEdit && widget.patinetEditDTO != null) {
      nameController.text = widget.patinetEditDTO!.patientName;
      addressController.text = widget.patinetEditDTO!.address;
      ageController.text = widget.patinetEditDTO!.age.toString();
      sexController.text = widget.patinetEditDTO!.sex;
      patientNumController.text = widget.patinetEditDTO!.patientNumber;
      phoneNumController.text = widget.patinetEditDTO!.phoneNumber;
      docController.text = widget.patinetEditDTO!.doctor;
    }
    if (widget.isToRegister) {
      nameController.text = widget.patientName;
      addressController.text = widget.patientAddress;
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
            'Add Patient Information',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                letterSpacing: .5,
                fontSize: size.width * 0.055,
                color: ToothNoteColors.kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
      backgroundColor: ToothNoteColors.kWhiteColor.withOpacity(0.9),
      body: Form(
        key: formKey,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              AddTextField(
                  controller: nameController,
                  isTextNumberType: false,
                  text: 'Patient Name',
                  isToValidate: true,
                  fieldColor: ToothNoteColors.backgroundColor),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              // AddTextField(
              //     controller: patientNumController,
              //     isTextNumberType: false,
              //     text: 'Patient Number',
              //     fieldColor: ToothNoteColors.backgroundColor),
              SizedBox(
                height: size.height * 0.02,
              ),
              AddTextField(
                  controller: ageController,
                  isTextNumberType: true,
                  text: 'Age',
                  fieldColor: ToothNoteColors.backgroundColor),
              SizedBox(
                height: size.height * 0.02,
              ),

              InkWell(
                onTap: () {
                  showDOBPopup(context, size);
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
                      SizedBox(width: size.width * 0.02),
                      Text(
                        'DOB',
                        style: TextStyle(
                            fontSize: size.width * 0.038,
                            fontWeight: FontWeight.w500,
                            color: ToothNoteColors.kredColor),
                      ),
                      SizedBox(width: size.width * 0.28),
                      const DOBTimeWidget(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: AddTextField(
                    controller: sexController,
                    isTextNumberType: true,
                    text: 'Sex',
                    isSex: true,
                    fieldColor: ToothNoteColors.backgroundColor),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              AddTextField(
                  controller: addressController,
                  isTextNumberType: false,
                  text: 'Address',
                  fieldColor: ToothNoteColors.backgroundColor),
              SizedBox(
                height: size.height * 0.02,
              ),
              AddTextField(
                  controller: phoneNumController,
                  isTextNumberType: true,
                  isToValidate: true,
                  text: 'Phone Number',
                  fieldColor: ToothNoteColors.backgroundColor),

              SizedBox(
                height: size.height * 0.02,
              ),
              AddTextField(
                  controller: docController,
                  isTextNumberType: true,
                  text: 'Select Doctor',
                  isDoc: true,
                  fieldColor: ToothNoteColors.backgroundColor),
              SizedBox(
                height: size.height * 0.02,
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
              SizedBox(
                height: size.height * 0.3,
              ),
            ],
          ),
        )),
      ),
      bottomSheet: SaveButton(
          docController: docController,
          isToEdit: widget.isToEdit,
          patientDTO:
              widget.patinetEditDTO != null ? widget.patinetEditDTO! : null,
          formKey: formKey,
          nameController: nameController,
          patientNumController: patientNumController,
          addressController: addressController,
          phoneNumController: phoneNumController,
          ageController: ageController,
          sexController: sexController,
          isToRegister: widget.isToRegister,
          patientsBookingId: widget.patientId,
          size: size),
    );
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

  Future<void> showDOBPopup(
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
                child: const DatePickingWidget()));
      },
    );
  }
}

class SaveButton extends ConsumerWidget {
  const SaveButton(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.patientNumController,
      required this.addressController,
      required this.phoneNumController,
      required this.ageController,
      required this.sexController,
      required this.size,
      required this.isToEdit,
      required this.docController,
      required this.isToRegister,
      required this.patientsBookingId,
      this.patientDTO});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController patientNumController;
  final TextEditingController addressController;
  final TextEditingController phoneNumController;
  final TextEditingController ageController;
  final TextEditingController sexController;
  final TextEditingController docController;
  final Size size;
  final bool isToEdit;
  final bool isToRegister;
  final String patientsBookingId;
  final PatientsDetailsDTO? patientDTO;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<AllPatientsBloc, AllPatientsState>(
      builder: (context, allpatientstate) {
        List<PatientsDetailsDTO> patientList = [];
        if (allpatientstate is displayallPatient) {
          patientList = allpatientstate.patient;
        }
        return InkWell(
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<PatientBloc>(context).add(
                  PatientEvent.addNewPatient(
                      patient: PatientsDetailsDTO(
                          medicine: !isToEdit ? null : patientDTO!.medicine,
                          newAppointment:
                              !isToEdit ? null : patientDTO!.newAppointment,
                          chiefComplaints:
                              !isToEdit ? null : patientDTO!.chiefComplaints,
                          payments: !isToEdit ? null : patientDTO!.payments,
                          diagnosis: !isToEdit ? null : patientDTO!.diagnosis,
                          drugAllergy:
                              !isToEdit ? null : patientDTO!.drugAllergy,
                          drughistory:
                              !isToEdit ? null : patientDTO!.drughistory,
                          examinationDetails:
                              !isToEdit ? null : patientDTO!.examinationDetails,
                          medicalHistory:
                              !isToEdit ? null : patientDTO!.medicalHistory,
                          pastDentalHistory:
                              !isToEdit ? null : patientDTO!.pastDentalHistory,
                          labInvestigation:
                              !isToEdit ? null : patientDTO!.labInvestigation,
                          points: !isToEdit ? null : patientDTO!.points,
                          treatmentDetails:
                              !isToEdit ? null : patientDTO!.treatmentDetails,
                          treatmentPlanning:
                              !isToEdit ? null : patientDTO!.treatmentPlanning,
                          patientId: isToEdit ? patientDTO!.patientId : null,
                          patientName: nameController.text,
                          patientNumber: isToEdit
                              ? patientDTO!.patientNumber
                              : 
                           //  'DDC 000${patientList.length + 1}'
                           getPatientNum(patientList)   
                              ,
                          address: addressController.text,
                          phoneNumber: phoneNumController.text,
                          age: double.parse(ageController.text.isEmpty
                              ? '0.0'
                              : ageController.text),
                          sex: sexController.text,
                          doctor: docController.text,
                          dob: ref.watch(dateOfBirthProvider).year ==
                                  DateTime.now().year
                              ? ''
                              : ref.watch(dateOfBirthProvider).toString(),
                          date: ref.watch(dateProvider).toString())));

              BlocProvider.of<AllPatientsBloc>(context)
                  .add(const AllPatientsEvent.getPatientList());
              Navigator.pop(context);

              if (isToRegister && patientsBookingId.isNotEmpty) {
                BlocProvider.of<BookingsBloc>(context).add(
                    BookingsEvent.deleteBookingsPatientDetail(
                        patientId: patientsBookingId));
                BlocProvider.of<AllBookingsBloc>(context)
                    .add(const AllBookingsEvent.getBookedPatientList());
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const PatientsScreen(),
                    ));
              }
            }
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
              'Save',
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
        );
      },
    );
  }
 String getPatientNum(List<PatientsDetailsDTO> patientList){
    final pNum='DDC 000${patientList.length + 1}';
    if(patientList.where((element) => element.patientNumber==pNum).toList().isEmpty){
      return pNum;
    }else{
return createPatientNum(patientList,'DDC 000${patientList.length + 2}',patientList.length + 2);
    }
  }
String  createPatientNum(List<PatientsDetailsDTO> patientList,String pNum,int startingLength){
 if(patientList.where((element) => element.patientNumber==pNum).toList().isEmpty){
      return pNum;
    }else{
return createPatientNum( patientList,'DDC 000${startingLength + 1}',startingLength+1);
    }
  }
}

class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CalendarDatePicker(
      initialDate: ref.watch(dateProvider),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
      onDateChanged: (value) {
        // log('Value${value.value}');
        addTime(value, ref);
        Navigator.pop(context);
      },
    );
  }
}

class DatePickingWidget extends ConsumerWidget {
  const DatePickingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CalendarDatePicker(
      initialDate: ref.watch(dateProvider),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
      onDateChanged: (value) {
        // log('Value${value.value}');
        addDOB(value, ref);
        Navigator.pop(context);
      },
    );
  }
}

class TimeWidget extends ConsumerWidget {
  const TimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime dateTime = ref.watch(dateProvider);

    return Text(
      '${dateTime.day} ${ToothList.monthNames[dateTime.month - 1]} ${dateTime.year}',
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

class DOBTimeWidget extends ConsumerWidget {
  const DOBTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime dateTime = ref.watch(dateOfBirthProvider);
    log('${dateTime.toString()}kk${DateTime.now()}');

    return Text(
      dateTime.year == DateTime.now().year
          ? 'Nil'
          : '${dateTime.day} ${ToothList.monthNames[dateTime.month - 1]} ${dateTime.year}',
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
