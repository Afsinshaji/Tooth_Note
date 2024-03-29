class TreatmentDetails {
  final String patientId;
  final String treatmentDetails;

  TreatmentDetails({required this.patientId, required this.treatmentDetails});
 TreatmentDetails fromMap(Map<String, dynamic> history) {
    return TreatmentDetails(
        patientId: history['patientId'],
        treatmentDetails: history['treatmentDetails']);
  }

  Map<String, dynamic> toMap() {
    return {'patientId': patientId, 'treatmentDetails': treatmentDetails};
  }
}
