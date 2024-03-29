class Diagnosis {
  final String patientId;
  final String diagnosis;

  Diagnosis({required this.patientId, required this.diagnosis});
 Diagnosis fromMap(Map<String, dynamic> diagnosis) {
    return Diagnosis(
        patientId: diagnosis['patientId'],
        diagnosis: diagnosis['diagnosis']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'diagnosis': diagnosis};
  }
}
