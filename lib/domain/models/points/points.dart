class Points {
  final String patientId;
  final List<dynamic> points;

  Points({required this.patientId, required this.points});
 Points fromMap(Map<String, dynamic> history) {
    return Points(
        patientId: history['patientId'],
        points: history['points']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'points': points};
  }
}
