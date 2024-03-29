import 'package:tooth_note/domain/models/treatment_details/treatment_details.dart';

class TreatmentDetailsDTO {
  final String patientId;
  final String treatmentDetails;

  TreatmentDetailsDTO(
      {required this.patientId, required this.treatmentDetails});
 static TreatmentDetailsDTO? fromModel(TreatmentDetails? history) {
  if (history == null) {
      return null;
    }
    return TreatmentDetailsDTO(
        patientId: history.patientId,
        treatmentDetails: history.treatmentDetails);
  }

  TreatmentDetails toModel() {
    return TreatmentDetails(
        patientId: patientId, treatmentDetails: treatmentDetails);
  }
}
