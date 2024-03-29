part of 'all_patients_bloc.dart';

@freezed
class AllPatientsState with _$AllPatientsState {
  const factory AllPatientsState.allPatientsInitial() = allPatientsInitial;
  const factory AllPatientsState.displayallPatient(
      {required List<PatientsDetailsDTO> patient}) = displayallPatient;
}
