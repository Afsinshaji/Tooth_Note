import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_bookings/all_bookings_bloc.dart';

import 'package:tooth_note/application/bookings/bookings_bloc.dart';
import 'package:tooth_note/application/view_dto/booking/booking.dart';
import 'package:tooth_note/presentation/screens/add_patient/widgets/add_textfield.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/utilities/colors.dart';
import 'package:tooth_note/utilities/list.dart';

class AddBookingScreen extends StatefulWidget {
  const AddBookingScreen(
      {super.key, this.isToEdit = false, this.patinetEditDTO});
  final bool isToEdit;
  final BookingsDTO? patinetEditDTO;

  @override
  State<AddBookingScreen> createState() => _AddBookingScreenState();
}

class _AddBookingScreenState extends State<AddBookingScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController phNumberController = TextEditingController();

  final TextEditingController patientNumController = TextEditingController();
  final TextEditingController timeSlotController = TextEditingController();
  final TextEditingController procedureController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.isToEdit && widget.patinetEditDTO != null) {
      nameController.text = widget.patinetEditDTO!.patientName;
      addressController.text = widget.patinetEditDTO!.address;
      phNumberController.text = widget.patinetEditDTO!.phNumber.toString();
      procedureController.text = widget.patinetEditDTO!.procedure;

      timeSlotController.text = widget.patinetEditDTO!.timeSlot;
      remarksController.text = widget.patinetEditDTO!.remarks;
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
            'Add Booking',
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
              InkWell(
                onTap: () {},
                child: AddTextField(
                    controller: timeSlotController,
                    isTextNumberType: true,
                    text: 'Time Slot',
                    isSlot: true,
                    fieldColor: ToothNoteColors.backgroundColor),
              ),
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
                  controller: addressController,
                  isTextNumberType: false,
                  text: 'Address',
                  fieldColor: ToothNoteColors.backgroundColor),
              SizedBox(
                height: size.height * 0.02,
              ),
              AddTextField(
                  controller: phNumberController,
                  isTextNumberType: true,
                  text: 'pH Number',
                  fieldColor: ToothNoteColors.backgroundColor),

              SizedBox(
                height: size.height * 0.02,
              ),

              AddTextField(
                  controller: procedureController,
                  isTextNumberType: false,
                  text: 'Procedure',
                  fieldColor: ToothNoteColors.backgroundColor),

              SizedBox(
                height: size.height * 0.02,
              ),
              AddTextField(
                  controller: remarksController,
                  isTextNumberType: false,
                  text: 'Remarks',
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
          remarksController: remarksController,
          isToEdit: widget.isToEdit,
          patientDTO:
              widget.patinetEditDTO != null ? widget.patinetEditDTO! : null,
          formKey: formKey,
          nameController: nameController,
          patientNumController: patientNumController,
          addressController: addressController,
          phNumberController: phNumberController,
          timeSlotController: timeSlotController,
          procedureController: procedureController,
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
      required this.phNumberController,
      required this.timeSlotController,
      required this.procedureController,
      required this.size,
      required this.isToEdit,
      required this.remarksController,
      this.patientDTO});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController patientNumController;
  final TextEditingController addressController;
  final TextEditingController phNumberController;
  final TextEditingController timeSlotController;
  final TextEditingController procedureController;
  final TextEditingController remarksController;
  final Size size;
  final bool isToEdit;
  final BookingsDTO? patientDTO;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<BookingsBloc>(context).add(
              BookingsEvent.addNewBookingsPatient(
                  patient: BookingsDTO(
                      patientId: isToEdit
                          ? patientDTO!.patientId
                          : 'Patient:${DateTime.now().millisecondsSinceEpoch.toString()}',
                      patientName: nameController.text,
                      phNumber: phNumberController.text,
                      procedure: procedureController.text,
                      remarks: remarksController.text,
                      timeSlot: timeSlotController.text,
                      date: ref.watch(dateProvider).toString(),
                      address: addressController.text)));
          BlocProvider.of<AllBookingsBloc>(context)
              .add(const AllBookingsEvent.getBookedPatientList());
          if (isToEdit) {
            BlocProvider.of<BookingsBloc>(context).add(
                BookingsEvent.getBookingsPatientsDetails(
                    patientId: patientDTO!.patientId));
          }

          Navigator.pop(context);
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
