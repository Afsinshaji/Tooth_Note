class LabInvestigation {
  final String patientId;
  final List<dynamic> labInvestigation;

  LabInvestigation({required this.patientId, required this.labInvestigation});
 LabInvestigation fromMap(Map<String, dynamic> history) {
    return LabInvestigation(
        patientId: history['patientId'],
        labInvestigation: history['labInvestigation']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'labInvestigation': labInvestigation};
  }
}
