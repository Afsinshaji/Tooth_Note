import 'package:tooth_note/domain/models/drug_history/drug_history.dart';

class DrugHistoryDTO {
  final String patientId;
  final List<dynamic> drugHistory;

  DrugHistoryDTO({required this.patientId, required this.drugHistory});
static DrugHistoryDTO? fromModel(DrugHistory? history) {
  if (history == null) {
      return null;
    }
     final list = history.drugHistory;
   
    return DrugHistoryDTO(
        patientId: history.patientId,
        drugHistory: list);
  }

  DrugHistory toModel() {
    return DrugHistory(patientId: patientId, drugHistory: drugHistory);
  }
}
