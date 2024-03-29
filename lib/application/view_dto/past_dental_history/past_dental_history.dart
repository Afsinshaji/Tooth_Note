import 'package:tooth_note/domain/models/past_dental_history/past_dental_history.dart';

class PastDentalHistoryDTO {
  final String patientId;
  final List<dynamic> pastDentalHistory;

  PastDentalHistoryDTO(
      {required this.patientId, required this.pastDentalHistory});
  static PastDentalHistoryDTO? fromModel(PastDentalHistory? history) {
    if (history == null) {
      return null;
    }
    final list = history.pastDentalHistory;
  
      return PastDentalHistoryDTO(
          patientId: history.patientId, pastDentalHistory: list);
    
  }

  PastDentalHistory toModel() {
    return PastDentalHistory(
        patientId: patientId, pastDentalHistory: pastDentalHistory);
  }
}
