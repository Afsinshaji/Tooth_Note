import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/infrastructure/patients/patients_implementation.dart';

part 'all_patients_event.dart';
part 'all_patients_state.dart';
part 'all_patients_bloc.freezed.dart';

class AllPatientsBloc extends Bloc<AllPatientsEvent, AllPatientsState> {
  AllPatientsBloc() : super(const allPatientsInitial()) {
    on<getPatientList>((event, emit) async {
      List<PatientsDetailsDTO> patientListDTO = [];
      final patientList =
          await PatientsImplementation.instance.getPatientsList();
      for (var patient in patientList) {
        patientListDTO.add(PatientsDetailsDTO.fromModel(patient));
      }

      emit(displayallPatient(patient: patientListDTO));
    });
  }
}
