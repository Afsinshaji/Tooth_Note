import 'package:tooth_note/domain/models/diagnosis/diagnosis.dart';

class DiagnosisDTO {
  final String patientId;
  final String diagnosis;

  DiagnosisDTO({required this.patientId, required this.diagnosis});
static DiagnosisDTO? fromModel(Diagnosis? diagnosis) {
  if (diagnosis == null) {
      return null;
    }
    return DiagnosisDTO(
        patientId: diagnosis.patientId,
        diagnosis: diagnosis.diagnosis);
  }

  Diagnosis toModel() {
    return Diagnosis(patientId: patientId, diagnosis: diagnosis);
  }
}
