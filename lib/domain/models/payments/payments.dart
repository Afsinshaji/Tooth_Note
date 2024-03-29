class Payments {
  final String patientId;
  final List<dynamic> payments;

  Payments({required this.patientId, required this.payments});
 Payments fromMap(Map<String, dynamic> history) {
    return Payments(
        patientId: history['patientId'],
        payments: history['payments']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'payments': payments};
  }
}
