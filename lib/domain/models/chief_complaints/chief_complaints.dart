class ChiefComplaints {
  final String patientId;
  final List<dynamic> chiefComplaints;

  ChiefComplaints({required this.patientId, required this.chiefComplaints});
 ChiefComplaints fromMap(Map<String, dynamic> complaint) {
    return ChiefComplaints(
        patientId: complaint['patientId'],
        chiefComplaints: complaint['chiefComplaints']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'chiefComplaints': chiefComplaints};
  }
}
