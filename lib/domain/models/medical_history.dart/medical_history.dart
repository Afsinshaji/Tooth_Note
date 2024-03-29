class MedicalHistory {
  final String patientId;
  final List<dynamic> medicalHistory;

  MedicalHistory({required this.patientId, required this.medicalHistory});
 MedicalHistory fromMap(Map<String, dynamic> history) {
    return MedicalHistory(
        patientId: history['patientId'],
        medicalHistory: history['medicalHistory']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'medicalHistory': medicalHistory};
  }
}
