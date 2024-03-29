import 'package:tooth_note/domain/models/treatment_planning/tretment_planning.dart';

class TreatmentPlanningDTO {
  final String patientId;
  final List<dynamic> treatmentPlanning;

  TreatmentPlanningDTO(
      {required this.patientId, required this.treatmentPlanning});
  static TreatmentPlanningDTO? fromModel(TreatmentPlanning? history) {
    if (history == null) {
      return null;
    }
    final list = history.treatmentPlanning;
    
      return TreatmentPlanningDTO(
          patientId: history.patientId, treatmentPlanning: list);

  }

  TreatmentPlanning toModel() {
    return TreatmentPlanning(
        patientId: patientId, treatmentPlanning: treatmentPlanning);
  }
}
