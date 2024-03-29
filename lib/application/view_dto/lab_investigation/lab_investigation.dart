import 'package:tooth_note/domain/models/lab_investigation/lab_investigation.dart';

class LabInvestigationDTO {
  final String patientId;
  final List<dynamic> labInvestigation;

  LabInvestigationDTO({required this.patientId, required this.labInvestigation});
  static LabInvestigationDTO? fromModel(LabInvestigation? history) {
    if (history == null) {
      return null;
    }
    final list =history.labInvestigation;
    
      return LabInvestigationDTO(
          patientId: history.patientId, 
          labInvestigation: list);
 
  }

  LabInvestigation toModel() {
    return LabInvestigation(patientId: patientId, labInvestigation: labInvestigation);
  }
}
