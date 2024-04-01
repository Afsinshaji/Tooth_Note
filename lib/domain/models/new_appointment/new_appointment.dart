class NewAppointment {
  final String patientId;
  final List<dynamic> newAppointment;

  NewAppointment({required this.patientId, required this.newAppointment});
 NewAppointment fromMap(Map<String, dynamic> history) {
    return NewAppointment(
        patientId: history['patientId'],
        newAppointment: history['newAppointment']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'newAppointment': newAppointment};
  }
}
