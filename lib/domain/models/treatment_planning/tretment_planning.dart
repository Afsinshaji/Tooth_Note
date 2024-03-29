class TreatmentPlanning {
  final String patientId;
  final List<dynamic> treatmentPlanning;

  TreatmentPlanning({required this.patientId, required this.treatmentPlanning});
 TreatmentPlanning fromMap(Map<String, dynamic> history) {
    return TreatmentPlanning(
        patientId: history['patientId'],
        treatmentPlanning: history['treatmentPlanning']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'treatmentPlanning': treatmentPlanning};
  }
}
