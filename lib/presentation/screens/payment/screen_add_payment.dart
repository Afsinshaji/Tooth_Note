import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/application/view_dto/payments/payments.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/screens/add_patient/widgets/add_textfield.dart';
import 'package:tooth_note/presentation/screens/payment/widgets/radio_box_widget.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/view_states/payment/transaction_list.dart';
import 'package:tooth_note/presentation/widgets/bottom_save_button.dart';
import 'package:tooth_note/utilities/colors.dart';
import 'package:tooth_note/utilities/list.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({
    super.key,
    this.isToEdit = false,
    this.index,
    this.text,this.amountName,
    required this.isInstallmet,
  });
  final bool isToEdit;
  final int? index;
  final String? text;
  final String? amountName;
  final bool isInstallmet;
  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController amountNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.isToEdit == true) {
      amountController.text = widget.text!;
      amountNameController.text = widget.amountName!;
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
            widget.isInstallmet ? 'Add Installment' : 'Add Fee',
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
              // Text('Amount',
              //     style: GoogleFonts.poppins(
              //       textStyle: TextStyle(
              //         fontSize: size.width * 0.035,
              //         color: ToothNoteColors.kBlackColor45,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     )),

                 AddTextField(
                  controller: amountController,
                  isTextNumberType: true,
                  isToValidate: true,
                  text: 'Amount',
                  fieldColor: ToothNoteColors.backgroundColor),
                   SizedBox(
                height: size.height * 0.05,
              ),
       widget.isInstallmet?const SizedBox():       AddTextField(
                  controller: amountNameController,
                  isTextNumberType: false,
                  text: 'Payment Name',
                  fieldColor: ToothNoteColors.backgroundColor),
           widget.isInstallmet?const SizedBox():   SizedBox(
                height: size.height * 0.05,
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
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      ToothList.transactionTypeList.length,
                      (index) => RadioBoxWidget(
                            transactionName:
                                ToothList.transactionTypeList[index],
                            transactionValue: transactionList(index),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: BottomWidget(
          isInstallment: widget.isInstallmet,
          editIndex: widget.index,
          isToEdit: widget.isToEdit,
          formKey: formKey,
          size: size,
          amountNameController: amountNameController,
          amountController: amountController),
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
}

class BottomWidget extends ConsumerWidget {
  const BottomWidget({
    super.key,
    required this.formKey,
    required this.size,
    required this.amountController,
    required this.amountNameController,
    required this.isInstallment,
    required this.isToEdit,
    required this.editIndex,
  });

  final GlobalKey<FormState> formKey;
  final Size size;
  final TextEditingController amountController;
  final TextEditingController amountNameController;
  final bool isInstallment;
  final bool isToEdit;
  final int? editIndex;

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
                  List<dynamic> paymentsList = [];
                  PaymentsDTO? paymentsDTO = patient.payments;
                  if (paymentsDTO != null) {
                    paymentsList = paymentsDTO.payments;
                  }
                  if (isToEdit == true) {
                    paymentsList[editIndex!] = {
                      'name': amountNameController.text,
                      'amount': amountController.text,
                      'type': convertTransactioType(
                          ref.watch(transactionTypeProvider)),
                      'date': ref.watch(dateProvider),
                      'isInstallment': isInstallment
                    };
                  } else {
                    paymentsList.add({
                      'name': amountNameController.text,
                      'amount': amountController.text,
                      'type': convertTransactioType(
                          ref.watch(transactionTypeProvider)),
                      'date': ref.watch(dateProvider),
                      'isInstallment': isInstallment
                    });
                  }

                  final newPaymentDTO = PaymentsDTO(
                      patientId: patient.patientId!, payments: paymentsList);

                  BlocProvider.of<PatientBloc>(context)
                      .add(PatientEvent.addPatient(
                          patient: PatientsDetailsDTO(
                    patientName: patient.patientName, newAppointment: patient.newAppointment, medicine: patient.medicine,
                    patientNumber: patient.patientNumber,
                    dob: patient.dob,
                    address: patient.address,doctor: patient.doctor,
                    phoneNumber: patient.phoneNumber,
                    age: patient.age,
                    sex: patient.sex,
                    date: patient.date,
                    chiefComplaints: patient.chiefComplaints,
                    labInvestigation: patient.labInvestigation,
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
                    payments: newPaymentDTO,
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

String convertTransactioType(TransactionTypes type) {
  if (type == TransactionTypes.cash) {
    return 'Cash';
  } else if (type == TransactionTypes.bank) {
    return 'Bank';
  } else if (type == TransactionTypes.wallet) {
    return 'Wallet';
  }
  return 'Cash';
}
