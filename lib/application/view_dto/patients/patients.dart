import 'package:tooth_note/application/view_dto/chief_complaints/chief_complaints.dart';
import 'package:tooth_note/application/view_dto/diagnosis/diagnosis.dart';
import 'package:tooth_note/application/view_dto/drug_allergy/drug_allergy.dart';
import 'package:tooth_note/application/view_dto/drug_history/drug_history.dart';
import 'package:tooth_note/application/view_dto/examination_details/examination_details.dart';
import 'package:tooth_note/application/view_dto/lab_investigation/lab_investigation.dart';
import 'package:tooth_note/application/view_dto/medical_history.dart/medical_history.dart';
import 'package:tooth_note/application/view_dto/new_appointment/new_appointment.dart';
import 'package:tooth_note/application/view_dto/past_dental_history/past_dental_history.dart';
import 'package:tooth_note/application/view_dto/payments/payments.dart';
import 'package:tooth_note/application/view_dto/points/points.dart';
import 'package:tooth_note/application/view_dto/treatment_details/treatment_details.dart';
import 'package:tooth_note/application/view_dto/treatment_planning/tretment_planning.dart';
import 'package:tooth_note/domain/models/patients/patients.dart';

class PatientsDetailsDTO {
  final String patientName;
  final String patientNumber;
  final String address;
  final String phoneNumber;
  final double age;
  final String sex;
  final String? patientId;
  final String date;
  final MedicalHistoryDTO? medicalHistory;
  final ChiefComplaintsDTO? chiefComplaints;
  final PastDentalHistoryDTO? pastDentalHistory;
  final DrugHistoryDTO? drughistory;
  final DrugAllergyDTO? drugAllergy;
  final ExaminationDetailsDTO? examinationDetails;
  final DiagnosisDTO? diagnosis;
  final TreatmentPlanningDTO? treatmentPlanning;
  final TreatmentDetailsDTO? treatmentDetails;
  final PointsDTO? points;
  final LabInvestigationDTO? labInvestigation;
  final PaymentsDTO? payments;
  final String dob;
  final String doctor;
  final NewAppointmentDTO? newAppointment;

  PatientsDetailsDTO(
      {required this.patientName,
      required this.patientNumber,
      required this.address,
      required this.phoneNumber,
      required this.age,
      required this.sex,required this.doctor,
      this.labInvestigation,
      this.payments,
      this.patientId,
      this.newAppointment,
      required this.date,
      this.medicalHistory,
      this.chiefComplaints,
      this.diagnosis,
      this.drugAllergy,
      this.drughistory,
      this.examinationDetails,
      this.pastDentalHistory,
      this.points,
      required this.dob,
      this.treatmentDetails,
      this.treatmentPlanning});

  PatientsDetails toModel() {
    return PatientsDetails(
      doctor: doctor,
      dob: dob,
      patientName: patientName,
      patientNumber: patientNumber,
      address: address,
      phoneNumber: phoneNumber,
      age: age,
      sex: sex,
      patientId: patientId == null
          ? 'Patient:${DateTime.now().millisecondsSinceEpoch.toString()}'
          : patientId!,
      date: date,
      newAppointment: newAppointment == null ? null : newAppointment!.toModel(),
      payments: payments == null ? null : payments!.toModel(),
      labInvestigation:
          labInvestigation == null ? null : labInvestigation!.toModel(),
      chiefComplaints:
          chiefComplaints == null ? null : chiefComplaints!.toModel(),
      diagnosis: diagnosis == null ? null : diagnosis!.toModel(),
      drugAllergy: drugAllergy == null ? null : drugAllergy!.toModel(),
      drughistory: drughistory == null ? null : drughistory!.toModel(),
      examinationDetails:
          examinationDetails == null ? null : examinationDetails!.toModel(),
      medicalHistory: medicalHistory == null ? null : medicalHistory!.toModel(),
      pastDentalHistory:
          pastDentalHistory == null ? null : pastDentalHistory!.toModel(),
      points: points == null ? null : points!.toModel(),
      treatmentDetails:
          treatmentDetails == null ? null : treatmentDetails!.toModel(),
      treatmentPlanning:
          treatmentPlanning == null ? null : treatmentPlanning!.toModel(),
    );
  }

  static PatientsDetailsDTO fromModel(PatientsDetails patient) {
    return PatientsDetailsDTO(
      doctor: patient.doctor,
      dob: patient.dob,
      patientName: patient.patientName,
      patientNumber: patient.patientNumber,
      address: patient.address,
      phoneNumber: patient.phoneNumber,
      age: patient.age,
      sex: patient.sex,
      patientId: patient.patientId,
      date: patient.date,
      newAppointment: NewAppointmentDTO.fromModel(patient.newAppointment),
      payments: PaymentsDTO.fromModel(patient.payments),
      labInvestigation: LabInvestigationDTO.fromModel(patient.labInvestigation),
      medicalHistory: MedicalHistoryDTO.fromModel(patient.medicalHistory),
      chiefComplaints: ChiefComplaintsDTO.fromModel(patient.chiefComplaints),
      diagnosis: DiagnosisDTO.fromModel(patient.diagnosis),
      drugAllergy: DrugAllergyDTO.fromModel(patient.drugAllergy),
      drughistory: DrugHistoryDTO.fromModel(patient.drughistory),
      examinationDetails:
          ExaminationDetailsDTO.fromModel(patient.examinationDetails),
      pastDentalHistory:
          PastDentalHistoryDTO.fromModel(patient.pastDentalHistory),
      points: PointsDTO.fromModel(patient.points),
      treatmentDetails: TreatmentDetailsDTO.fromModel(patient.treatmentDetails),
      treatmentPlanning:
          TreatmentPlanningDTO.fromModel(patient.treatmentPlanning),
    );
  }
}
