import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/screens/chief_complaints/screen_chief_complaints.dart';
import 'package:tooth_note/presentation/screens/dental_history/screen_dental_history.dart';
import 'package:tooth_note/presentation/screens/diagnosis/diagnosis.dart';
import 'package:tooth_note/presentation/screens/drug_allergy/screen_drug_allergy.dart';
import 'package:tooth_note/presentation/screens/drug_history/screen_drug_history.dart';
import 'package:tooth_note/presentation/screens/examination_details/screen_examination_details.dart';
import 'package:tooth_note/presentation/screens/lab_investigation/screen_lab_investigation.dart';
import 'package:tooth_note/presentation/screens/medical_history/screen_medical_history.dart';
import 'package:tooth_note/presentation/screens/message/screen_message.dart';
import 'package:tooth_note/presentation/screens/new_appointment/screen_new_appointment.dart';
import 'package:tooth_note/presentation/screens/payment/screen_add_payment.dart';
import 'package:tooth_note/presentation/screens/payment/screen_payments.dart';
import 'package:tooth_note/presentation/screens/pdf/test.dart';
import 'package:tooth_note/presentation/screens/points/screen_points.dart';
import 'package:tooth_note/presentation/screens/treatment_details/screen_treatment_details.dart';
import 'package:tooth_note/presentation/screens/treatment_planning/screen_treatment_planning.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/widgets/alert_box.dart';
import 'package:tooth_note/presentation/widgets/click_button.dart';
import 'package:tooth_note/utilities/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPatientScreen extends ConsumerWidget {
  const ViewPatientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    PatientsDetailsDTO? patientDTO;
    return BlocBuilder<PatientBloc, PatientState>(
      builder: (context, patientstate) {
        if (patientstate is displayPatient) {
          patientDTO = patientstate.patient;
        }
        if (patientDTO == null) {
          return const Text('Empty');
        }
        double due = 0.0;
        if (patientDTO!.payments != null &&
            patientDTO!.payments!.payments.isNotEmpty) {
          double totalInstallment = 0.0;
          double totalfee = 0.0;
          for (var pay in patientDTO!.payments!.payments) {
            if (pay['isInstallment'] == true) {
              totalInstallment = totalInstallment +
                  double.parse(pay['amount'].isEmpty ? '0.0' : pay['amount']);
            } else {
              totalfee = totalfee +
                  double.parse(pay['amount'].isEmpty ? '0.0' : pay['amount']);
            }
          }
          due = totalfee - totalInstallment;
        }
        final date = DateTime.parse(patientDTO!.date);
        DateTime? dob;
        if (patientDTO!.dob.isNotEmpty) {
          dob = DateTime.parse(patientDTO!.dob);
        }
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
              actions: [
                IconButton(
                    onPressed: () {
                      alertBox(context, 'Delete', () {
                        BlocProvider.of<PatientBloc>(context).add(
                            PatientEvent.deletePatientDetail(
                                patientId: patientDTO!.patientId!));
                        BlocProvider.of<AllPatientsBloc>(context)
                            .add(const AllPatientsEvent.getPatientList());

                        Navigator.pop(context);
                        Navigator.pop(context);
                      }, size);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: ToothNoteColors.kWhiteColor,
                    ))
              ],
              title: Text(
                'Patient Information',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width,
                      color: ToothNoteColors.backgroundColor,
                      alignment: Alignment.center,
                      child: Text(
                        patientDTO!.patientName.isEmpty
                            ? 'Nil'
                            : patientDTO!.patientName,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: size.width * 0.05,
                            color: ToothNoteColors.kWhiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: size.width * 0.1,
                        left: size.width * 0.1,
                        child: Material(
                          shadowColor: ToothNoteColors.kBlackColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15)),
                          color: ToothNoteColors.kWhiteColor,
                          child: SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          "tel:${patientDTO!.phoneNumber}");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    icon: const Icon(Icons.call)),
                                EditButton(patientDTO: patientDTO),
                                FutureBuilder(
                                    future: creatingpdf(size, patientDTO!),
                                    builder: (context, filesnap) {
                                      return IconButton(
                                          onPressed: () async {
                                            if (filesnap.hasData) {
                                              Share.shareXFiles(
                                                  [XFile(filesnap.data!.path)],
                                                  text: patientDTO!.patientName,
                                                  subject: 'Patient File',
                                                  sharePositionOrigin:
                                                      Rect.fromPoints(
                                                          Offset.zero,
                                                          Offset.zero));
                                            }

                                            // await creatingpdf(size, patientDTO!);
                                          },
                                          icon: const Icon(Icons.download));
                                    }),
                                InkWell(
                                  onTap: () {
                                    ////here
                                    initializeDate(ref);
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const MessageScreen(),
                                        ));
                                  },
                                  child: Image.asset(
                                    'assets/images/whatsapp-icon-2040x2048-8b5th74o.png',
                                    width: size.width * 0.08,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FielAndValueText(
                              size: size,
                              field: 'Patient Number',
                              value: patientDTO!.patientNumber.isEmpty
                                  ? 'Nil'
                                  : patientDTO!.patientNumber),
                          SizedBox(width: size.width * 0.25),
                          FielAndValueText(
                              size: size,
                              field: 'Phone Number',
                              value: patientDTO!.phoneNumber.isEmpty
                                  ? 'Nil'
                                  : patientDTO!.phoneNumber),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        children: [
                          FielAndValueText(
                              size: size,
                              field: 'Age',
                              value: patientDTO!.age == 0.0 && dob != null
                                  ? calculateAge(dob).toString()
                                  : patientDTO!.age == 0.0
                                      ? 'Nil'
                                      : patientDTO!.age.toString()),
                          SizedBox(width: size.width * 0.5),
                          FielAndValueText(
                              size: size,
                              field: 'Sex',
                              value: patientDTO!.sex.isEmpty
                                  ? 'Nil'
                                  : patientDTO!.sex),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: FielAndValueText(
                                size: size,
                                field: 'Address',
                                value: patientDTO!.address.isEmpty
                                    ? 'Nil'
                                    : patientDTO!.address),
                          ),
                          SizedBox(width: size.width * 0.09),
                          FielAndValueText(
                              size: size,
                              field: 'Doctor',
                              value: patientDTO!.doctor.isEmpty
                                  ? 'Nil'
                                  : patientDTO!.doctor),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        children: [
                          FielAndValueText(
                              size: size,
                              field: 'Date Added',
                              value:
                                  "${date.day} - ${date.month} - ${date.year}"),
                          SizedBox(width: size.width * 0.32),
                          FielAndValueText(
                              size: size,
                              field: 'Date Of Birth',
                              value: dob == null
                                  ? 'Nil'
                                  : "${dob.day} - ${dob.month} - ${dob.year}"),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      ClickButton(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddPaymentScreen(
                                      isInstallmet: false),
                                ));
                          },
                          width: size.width,
                          height: size.height * 0.055,
                          backGroundColor: ToothNoteColors.kredColor,
                          changeColor:
                              ToothNoteColors.kWhiteColor.withOpacity(0.9),
                          text: 'Add Fee ₹',
                          radius: 5),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const ChiefComplaintsScreen(),
                                ));
                          },
                          prefixIcon: Icons.medical_information,
                          subtitle: 'Add Chief Complaints',
                          title: 'Chief Complaints'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const MedicalHistoryScreen(),
                                ));
                          },
                          prefixIcon: Icons.punch_clock,
                          subtitle: 'Add Patient Medical History',
                          title: 'Medical History'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const DentalHistoryScreen(),
                                ));
                          },
                          prefixIcon: Icons.health_and_safety_sharp,
                          subtitle: 'Add Past Dental History',
                          title: 'Dental History'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            String allergy = '';
                            if (patientDTO!.drugAllergy != null) {
                              allergy = patientDTO!.drugAllergy!.drugAllergy;
                            }
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      DrugAllergyScreen(text: allergy),
                                ));
                          },
                          prefixIcon: Icons.radio_button_checked,
                          subtitle: 'Add Drug Allergies',
                          title: 'Drug Allergy'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const DrugHistoryScreen(),
                                ));
                          },
                          prefixIcon: Icons.history,
                          subtitle: 'Add Drug History',
                          title: 'Drug History'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const ExaminationDetailsScreen(),
                                ));
                          },
                          prefixIcon: Icons.check_box,
                          subtitle: 'Add Examination Details',
                          title: 'Examination Details'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const LabInvestigationScreen(),
                                ));
                          },
                          prefixIcon: Icons.science,
                          subtitle: 'Add Lab Results',
                          title: 'Lab Investigation'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            String diagnosis = '';
                            if (patientDTO!.diagnosis != null) {
                              diagnosis = patientDTO!.diagnosis!.diagnosis;
                            }
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      DiagnosisScreen(text: diagnosis),
                                ));
                          },
                          prefixIcon: Icons.search,
                          subtitle: 'Add Diagnosis Details',
                          title: 'Diagnosis'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const TreatmentPlanningScreen(),
                                ));
                          },
                          prefixIcon: Icons.add_chart,
                          subtitle: 'Add Treatment Plans',
                          title: 'Treatment Planning'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            String treatment = '';
                            if (patientDTO!.treatmentDetails != null) {
                              treatment = patientDTO!
                                  .treatmentDetails!.treatmentDetails;
                            }
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      TreatmentDetailsScreen(text: treatment),
                                ));
                          },
                          prefixIcon: Icons.medical_services_outlined,
                          subtitle: 'Add Treatment Details',
                          title: 'Treatment Details'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const PaymentsScreen(),
                                ));
                          },
                          prefixIcon: Icons.currency_rupee,
                          subtitle: 'Add Payments & due',
                          title: 'Payments'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const NewAppointmentScreen(),
                                ));
                          },
                          prefixIcon: Icons.table_chart,
                          subtitle: 'Add New Appointment',
                          title: 'New Appointment'),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Detailscontainer(
                          onTap: () {
                            initializeDate(ref);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const PointsScreen(),
                                ));
                          },
                          prefixIcon: Icons.book,
                          subtitle: 'Add Points To Remember',
                          title: 'Points'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  int calculateAge(DateTime dob) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - dob.year;
    int month1 = currentDate.month;
    int month2 = dob.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = dob.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}

class EditButton extends ConsumerWidget {
  const EditButton({
    super.key,
    required this.patientDTO,
  });

  final PatientsDetailsDTO? patientDTO;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          addTime(DateTime.parse(patientDTO!.date), ref);
          addDOB(DateTime.parse(patientDTO!.dob.isEmpty?DateTime.now().toString()
          :patientDTO!.dob), ref);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPatientScreen(
                  isToEdit: true,
                  patinetEditDTO: patientDTO,
                ),
              ));
        },
        icon: const Icon(Icons.edit));
  }
}

class Detailscontainer extends StatelessWidget {
  const Detailscontainer(
      {super.key,
      required this.prefixIcon,
      required this.title,
      required this.subtitle,
      this.onTap});
  final IconData prefixIcon;
  final String title;
  final String subtitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
        shadowColor: ToothNoteColors.kBlackColor,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5)),
        color: ToothNoteColors.kWhiteColor,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
              height: size.height * 0.1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Row(
                  children: [
                    Icon(
                      prefixIcon,
                      color: ToothNoteColors.backgroundColor,
                      size: size.width * 0.13,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 0.48,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: size.width * 0.045,
                                color: ToothNoteColors.kBlackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Text(
                            subtitle,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: size.width * 0.03,
                                color: ToothNoteColors.kBlackColor
                                    .withOpacity(0.6),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ToothNoteColors.backgroundColor,
                      size: size.width * 0.07,
                    ),
                  ],
                ),
              )),
        ));
  }
}

class FielAndValueText extends StatelessWidget {
  const FielAndValueText({
    super.key,
    required this.size,
    required this.field,
    required this.value,
  });

  final Size size;
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: size.width * 0.04,
              color: ToothNoteColors.kBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.005,
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: size.width * 0.04,
              color: ToothNoteColors.kBlackColor.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.005,
        ),
      ],
    );
  }
}
