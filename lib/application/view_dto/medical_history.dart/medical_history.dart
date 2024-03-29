import 'package:tooth_note/domain/models/medical_history.dart/medical_history.dart';

class MedicalHistoryDTO {
  final String patientId;
  final List<dynamic> medicalHistory;

  MedicalHistoryDTO({required this.patientId, required this.medicalHistory});
  static MedicalHistoryDTO? fromModel(MedicalHistory? history) {
    if (history == null) {
      return null;
    }
    final list =history.medicalHistory;
    
      return MedicalHistoryDTO(
          patientId: history.patientId, 
          medicalHistory: list);
 
  }

  MedicalHistory toModel() {
    return MedicalHistory(patientId: patientId, medicalHistory: medicalHistory);
  }
}
