part of 'patient_bloc.dart';

@freezed
class PatientEvent with _$PatientEvent {
  const factory PatientEvent.addPatient({required PatientsDetailsDTO patient}) =
      addPatient;
  const factory PatientEvent.addNewPatient({required PatientsDetailsDTO patient}) =
      addNewPatient;
  const factory PatientEvent.addLabFiles({
    required PatientsDetailsDTO patient,required File file, required String name,required String fileExtension}) =
      addLabFiles;
  const factory PatientEvent.getPatientsDetails({required String patientId}) =
      getPatientsDetails;
  const factory PatientEvent.deletePatientDetail({required String patientId}) =
      deletePatientDetail;
}
