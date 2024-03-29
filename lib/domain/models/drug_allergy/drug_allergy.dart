class DrugAllergy {
  final String patientId;
  final String drugAllergy;

  DrugAllergy({required this.patientId, required this.drugAllergy});
 DrugAllergy fromMap(Map<String, dynamic> history) {
    return DrugAllergy(
        patientId: history['patientId'],
        drugAllergy: history['drugAllergy']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'drugAllergy': drugAllergy};
  }
}
