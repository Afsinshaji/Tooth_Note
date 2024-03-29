class DrugHistory {
  final String patientId;
  final List<dynamic> drugHistory;

  DrugHistory({required this.patientId, required this.drugHistory});
 DrugHistory fromMap(Map<String, dynamic> history) {
    return DrugHistory(
        patientId: history['patientId'],
        drugHistory: history['drugHistory']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'drugHistory': drugHistory};
  }
}
