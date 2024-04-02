class Medicine {
  final String patientId;
  final String medicine;

  Medicine({required this.patientId, required this.medicine});
 Medicine fromMap(Map<String, dynamic> history) {
    return Medicine(
        patientId: history['patientId'],
        medicine: history['medicine']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'medicine': medicine};
  }
}
