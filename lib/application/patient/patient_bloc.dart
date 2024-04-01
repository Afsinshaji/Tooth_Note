import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/infrastructure/patients/patients_implementation.dart';

part 'patient_event.dart';
part 'patient_state.dart';
part 'patient_bloc.freezed.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc() : super(const patientInitial()) {
    on<addNewPatient>((event, emit) async {
      await PatientsImplementation.instance
          .addPatientdetails(event.patient.toModel());
      //add(getPatientsDetails(patientId: event.patient.patientId!));
    });
    on<addPatient>((event, emit) async {
      await PatientsImplementation.instance
          .addPatientdetails(event.patient.toModel());
      add(getPatientsDetails(patientId: event.patient.patientId!));
    });

    on<addLabFiles>((event, emit) async {
      emit(
        displayPatient(patient: event.patient, isLoading: true),
      );
      await PatientsImplementation.instance.addLabFile(
          event.patient.toModel(), event.file, event.name, event.fileExtension);
      add(getPatientsDetails(patientId: event.patient.patientId!));
    });
    on<getPatientsDetails>((event, emit) async {
      final patient = await PatientsImplementation.instance
          .getPatientDetails(event.patientId);
      if (patient != null) {
        emit(
          displayPatient(
              patient: PatientsDetailsDTO.fromModel(patient), isLoading: false),
        );
      }
    });

    on<deletePatientDetail>((event, emit) async {
      await PatientsImplementation.instance
          .deletePatientDetails(event.patientId);
      add(getPatientsDetails(patientId: event.patientId));
    });
  }
}
