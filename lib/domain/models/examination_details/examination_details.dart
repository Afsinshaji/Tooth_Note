class ExaminationDetails {
  final String patientId;
  final List<dynamic> examinationDetails;

  ExaminationDetails(
      {required this.patientId, required this.examinationDetails});
  ExaminationDetails fromMap(Map<String, dynamic> history) {
    return ExaminationDetails(
        patientId: history['patientId'],
        examinationDetails: history['examinationDetails']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'examinationDetails': examinationDetails};
  }
}
