import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/application/view_dto/payments/payments.dart';
import 'package:tooth_note/presentation/screens/payment/screen_add_payment.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/alert_box.dart';
import 'package:tooth_note/presentation/widgets/click_button.dart';
import 'package:tooth_note/utilities/colors.dart';

class PaymentsScreen extends ConsumerWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    PatientsDetailsDTO? patientDTO;
    return Scaffold(
      bottomSheet: Container(
        height: size.height * 0.11,
        padding: EdgeInsets.all(size.width * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClickButton(
                onTap: () {
                  initializeDate(ref);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AddPaymentScreen(isInstallmet: true),
                      ));
                },
                width: size.width * 0.8,
                backGroundColor: ToothNoteColors.kGreenColor,
                changeColor: ToothNoteColors.kGreenColor.withOpacity(0.5),
                text: 'Payment',
                radius: 5)
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: size * 0.2,
        child: ColoredBox(
          color: ToothNoteColors.backgroundColor,
          child: Column(
            children: [
              AppBar(
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
                    'Payments',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: size.width * 0.055,
                        color: ToothNoteColors.kWhiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
              BlocBuilder<PatientBloc, PatientState>(
                builder: (context, patientstate) {
                  if (patientstate is displayPatient) {
                    patientDTO = patientstate.patient;
                  }
                  if (patientDTO == null) {
                    return const Text('Empty');
                  }
                  double due = 0.0;
                  double totalInstallment = 0.0;
                  double totalfee = 0.0;
                  if (patientDTO!.payments != null &&
                      patientDTO!.payments!.payments.isNotEmpty) {
                    for (var pay in patientDTO!.payments!.payments) {
                      if (pay['isInstallment'] == true) {
                        totalInstallment =
                            totalInstallment + double.parse(pay['amount'].isEmpty?'0.0':pay['amount']);
                      } else {
                        totalfee = totalfee + double.parse(pay['amount'].isEmpty?'0.0':pay['amount']);
                      }
                    }
                    due = totalfee - totalInstallment;
                  }
                  return Container(
                    margin: EdgeInsets.all(size.width * 0.05),
                    decoration: BoxDecoration(
                        color: ToothNoteColors.kWhiteColor,
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        AmountNotifier(
                          size: size,
                          amount: '₹$due',
                          fieldName: 'Due',
                        ),
                        Container(
                          width: size.width * 0.01,
                          color: ToothNoteColors.backgroundColor,
                          height: size.height * 0.07,
                        ),
                        AmountNotifier(
                          size: size,
                          amount: '₹$totalfee',
                          fieldName: 'Fee',
                        ),
                        Container(
                          width: size.width * 0.01,
                          color: ToothNoteColors.backgroundColor,
                          height: size.height * 0.07,
                        ),
                        AmountNotifier(
                          size: size,
                          amount: '₹$totalInstallment',
                          fieldName: 'Payment',
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, patientstate) {
          PatientsDetailsDTO? patient;
          if (patientstate is displayPatient) {
            patient = patientstate.patient;
          }
          if (patient == null ||
              patient.payments == null ||
              patient.payments!.payments.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/sammy-shield-medical-protection (1).gif',
                width: size.width * 0.5,
              ),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              if (index == patient!.payments!.payments.length) {
                return SizedBox(
                  height: size.height * 0.18,
                );
              }
              return EachContainerBox(
                size: size,
                patient: patient,
                index: index,
              );
            },
            itemCount: patient.payments!.payments.length + 1,
          );
        },
      ),
    );
  }
}

class AmountNotifier extends StatelessWidget {
  const AmountNotifier({
    super.key,
    required this.size,
    required this.fieldName,
    required this.amount,
  });

  final Size size;
  final String fieldName;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.29,
      height: size.height * 0.07,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fieldName,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: size.width * 0.045,
                color: ToothNoteColors.backgroundColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: size.width * 0.04,
                color: ToothNoteColors.backgroundColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EachContainerBox extends ConsumerWidget {
  const EachContainerBox(
      {super.key,
      required this.size,
      required this.patient,
      required this.index});

  final Size size;
  final PatientsDetailsDTO? patient;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime? date;
    log('${patient!.payments!.payments[index]}');
    if (patient!.payments!.payments[index]['date'] is Timestamp) {
      date = patient!.payments!.payments[index]['date'].toDate();
    }
    return InkWell(
      onLongPress: () {
        showPopupMenu(context, size, patient!, index);
      },
      onTap: () {
        addTime(date!, ref);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPaymentScreen(
                isInstallmet: patient!.payments!.payments[index]
                    ['isInstallment'],
                isToEdit: true,
                index: index,
                amountName: patient!.payments!.payments[index]['name'] ?? '',
                text: patient!.payments!.payments[index]['amount'],
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.all(size.width * 0.025),
        width: size.width,
        //  height: size.height * 0.075,
        padding: EdgeInsets.symmetric(
            vertical: size.width * 0.05, horizontal: size.width * 0.05),

        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: ToothNoteColors.kBlackColor45,
                  blurRadius: 3,
                  offset: Offset(4, 4),
                  spreadRadius: 2)
            ],
            color: patient!.payments!.payments[index]['isInstallment'] == true
                ? ToothNoteColors.kGreenColor
                : ToothNoteColors.backgroundColor,
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  patient!.payments!.payments[index]['isInstallment'] == true
                      ? 'Installment'
                      : 'Fee - ${patient!.payments!.payments[index]['name'] ?? ''}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      letterSpacing: .5,
                      fontSize: size.width * 0.045,
                      color: ToothNoteColors.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "₹${patient!.payments!.payments[index]['amount']}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      letterSpacing: .5,
                      fontSize: size.width * 0.045,
                      color: ToothNoteColors.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date == null ? '' : "${date.day}/${date.month}/${date.year}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: size.width * 0.04,
                      color: ToothNoteColors.kWhiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  "${patient!.payments!.payments[index]['type']}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: size.width * 0.04,
                      color: ToothNoteColors.kWhiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void showPopupMenu(
    BuildContext context, Size size, PatientsDetailsDTO patient, int index) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RenderBox button = context.findRenderObject() as RenderBox;

  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(button.size.topRight(Offset.zero),
          ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  showMenu(
    color: ToothNoteColors.backgroundColor,
    context: context,
    position: position,
    items: [
      PopupMenuItem(
        value: 1,
        child: Row(
          children: [
            const Icon(
              Icons.delete,
              color: ToothNoteColors.kWhiteColor,
            ),
            Text(
              'delete',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  letterSpacing: .5,
                  color: ToothNoteColors.kWhiteColor.withOpacity(0.9),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  ).then((value) {
    if (value != null) {
      if (value == 1) {
        alertBox(context, 'Delete', () {
          List<dynamic> paymentsList = [];
          PaymentsDTO? paymentsDTO = patient.payments;
          if (paymentsDTO != null) {
            paymentsList = paymentsDTO.payments;
          }
          paymentsList.removeAt(index);
          final newPaymentsDTO = PaymentsDTO(
              patientId: patient.patientId!, payments: paymentsList);
          BlocProvider.of<PatientBloc>(context).add(PatientEvent.addPatient(
              patient: PatientsDetailsDTO(
            payments: newPaymentsDTO, newAppointment: patient.newAppointment, medicine: patient.medicine,
            patientName: patient.patientName,doctor: patient.doctor,
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
            medicalHistory: patient.medicalHistory,
            pastDentalHistory: patient.pastDentalHistory,
            patientId: patient.patientId,
            points: patient.points,
            labInvestigation: patient.labInvestigation,
            treatmentDetails: patient.treatmentDetails,
            treatmentPlanning: patient.treatmentPlanning,
          )));
          BlocProvider.of<AllPatientsBloc>(context)
              .add(const AllPatientsEvent.getPatientList());

          Navigator.pop(context);
        }, size);
      }
    }
  });
}
