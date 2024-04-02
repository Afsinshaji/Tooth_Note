import 'dart:developer';

import 'package:tooth_note/domain/models/chief_complaints/chief_complaints.dart';
import 'package:tooth_note/domain/models/diagnosis/diagnosis.dart';
import 'package:tooth_note/domain/models/drug_allergy/drug_allergy.dart';
import 'package:tooth_note/domain/models/drug_history/drug_history.dart';
import 'package:tooth_note/domain/models/examination_details/examination_details.dart';
import 'package:tooth_note/domain/models/lab_investigation/lab_investigation.dart';
import 'package:tooth_note/domain/models/medical_history.dart/medical_history.dart';
import 'package:tooth_note/domain/models/medicine/medicine.dart';
import 'package:tooth_note/domain/models/new_appointment/new_appointment.dart';
import 'package:tooth_note/domain/models/past_dental_history/past_dental_history.dart';
import 'package:tooth_note/domain/models/payments/payments.dart';
import 'package:tooth_note/domain/models/points/points.dart';
import 'package:tooth_note/domain/models/treatment_details/treatment_details.dart';
import 'package:tooth_note/domain/models/treatment_planning/tretment_planning.dart';

class PatientsDetails {
  final String patientName;
  final String patientNumber;
  final String address;
  final String doctor;
  final String phoneNumber;
  final double age;
  final String sex;
  final String patientId;
  final String date;
  final String dob;
  final MedicalHistory? medicalHistory;
  final ChiefComplaints? chiefComplaints;
  final PastDentalHistory? pastDentalHistory;
  final DrugHistory? drughistory;
  final DrugAllergy? drugAllergy;
  final ExaminationDetails? examinationDetails;
  final Diagnosis? diagnosis;
  final TreatmentPlanning? treatmentPlanning;
  final TreatmentDetails? treatmentDetails;
  final Points? points;
  final LabInvestigation? labInvestigation;
  final Payments? payments;
  final NewAppointment? newAppointment;
  final Medicine? medicine;

  PatientsDetails(
      {required this.patientName,
      required this.patientNumber,
      required this.address,
      required this.phoneNumber,
      required this.age,
      required this.doctor,
      required this.sex,
      required this.patientId,
      required this.date,
      required this.dob,
      this.medicine,
      this.newAppointment,
      this.payments,
      this.medicalHistory,
      this.chiefComplaints,
      this.diagnosis,
      this.drugAllergy,
      this.drughistory,
      this.examinationDetails,
      this.pastDentalHistory,
      this.points,
      this.treatmentDetails,
      this.labInvestigation,
      this.treatmentPlanning});

  Map<String, dynamic> toMap() {
    return {
      'doctor': doctor,
      'dob': dob,
      'patientName': patientName,
      'patientNumber': patientNumber,
      'address': address,
      'phoneNumber': phoneNumber,
      'age': age,
      'sex': sex,
      'patientId': patientId,
      'date': date,
      'medicine': medicine == null ? null : medicine!.medicine,
      'newAppointment':
          newAppointment == null ? null : newAppointment!.newAppointment,
      'payments': payments == null ? null : payments!.payments,
      'medicalHistory':
          medicalHistory == null ? null : medicalHistory!.medicalHistory,
      'labInvestigation':
          labInvestigation == null ? null : labInvestigation!.labInvestigation,
      'chiefComplaints':
          chiefComplaints == null ? null : chiefComplaints!.chiefComplaints,
      'diagnosis': diagnosis == null ? null : diagnosis!.diagnosis,
      'drugAllergy': drugAllergy == null ? null : drugAllergy!.drugAllergy,
      'drughistory': drughistory == null ? null : drughistory!.drugHistory,
      'examinationDetails': examinationDetails == null
          ? null
          : examinationDetails!.examinationDetails,
      'pastDentalHistory': pastDentalHistory == null
          ? null
          : pastDentalHistory!.pastDentalHistory,
      'points': points == null ? null : points!.points,
      'treatmentDetails':
          treatmentDetails == null ? null : treatmentDetails!.treatmentDetails,
      'treatmentPlanning': treatmentPlanning == null
          ? null
          : treatmentPlanning!.treatmentPlanning
    };
  }

  static PatientsDetails fromMap(Map<String, dynamic> patient) {
    log(patient.toString());

    return PatientsDetails(
      doctor: patient['doctor'] ?? '',
      dob: patient['dob'] ?? '',
      patientName: patient['patientName'],
      patientNumber: patient['patientNumber'],
      address: patient['address'],
      phoneNumber: patient['phoneNumber'],
      age: patient['age'],
      sex: patient['sex'],
      patientId: patient['patientId'],
      date: patient['date'],
      medicine: Medicine(
          patientId: patient['patientId'], medicine: patient['medicine'] ?? ''),
      newAppointment: NewAppointment(
          patientId: patient['patientId'],
          newAppointment: patient['newAppointment'] ?? []),
      payments: Payments(
          patientId: patient['patientId'], payments: patient['payments'] ?? []),
      medicalHistory: MedicalHistory(
          patientId: patient['patientId'],
          medicalHistory: patient['medicalHistory'] ?? []),
      chiefComplaints: ChiefComplaints(
          patientId: patient['patientId'],
          chiefComplaints: patient['chiefComplaints'] ?? []),
      diagnosis: Diagnosis(
          patientId: patient['patientId'],
          diagnosis: patient['diagnosis'] ?? ''),
      drugAllergy: DrugAllergy(
          patientId: patient['patientId'],
          drugAllergy: patient['drugAllergy'] ?? ''),
      drughistory: DrugHistory(
          patientId: patient['patientId'],
          drugHistory: patient['drughistory'] ?? []),
      examinationDetails: ExaminationDetails(
          patientId: patient['patientId'],
          examinationDetails: patient['examinationDetails'] ?? []),
      pastDentalHistory: PastDentalHistory(
          patientId: patient['patientId'],
          pastDentalHistory: patient['pastDentalHistory'] ?? []),
      points: Points(
          patientId: patient['patientId'], points: patient['points'] ?? []),
      labInvestigation: LabInvestigation(
          patientId: patient['patientId'],
          labInvestigation: patient['labInvestigation'] ?? []),
      treatmentDetails: TreatmentDetails(
          patientId: patient['patientId'],
          treatmentDetails: patient['treatmentDetails'] ?? ''),
      treatmentPlanning: TreatmentPlanning(
          patientId: patient['patientId'],
          treatmentPlanning: patient['treatmentPlanning'] ?? []),
    );
  }
}
