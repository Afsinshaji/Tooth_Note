class PastDentalHistory {
  final String patientId;
  final List<dynamic> pastDentalHistory;

  PastDentalHistory({required this.patientId, required this.pastDentalHistory});
 PastDentalHistory fromMap(Map<String, dynamic> history) {
    return PastDentalHistory(
        patientId: history['patientId'],
        pastDentalHistory: history['pastDentalHistory']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'pastDentalHistory': pastDentalHistory};
  }
}
