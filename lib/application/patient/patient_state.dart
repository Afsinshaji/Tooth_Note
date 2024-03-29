part of 'patient_bloc.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState.patientInitial() = patientInitial;
  const factory PatientState.displayPatient(
      {required PatientsDetailsDTO patient,
      required bool isLoading}) = displayPatient;
}
