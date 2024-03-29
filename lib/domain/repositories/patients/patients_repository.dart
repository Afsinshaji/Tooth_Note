import 'dart:io';

import 'package:tooth_note/domain/models/patients/patients.dart';

abstract class PatientsRepository {
  Future<void> addPatientdetails(PatientsDetails patient);
  Future<List<PatientsDetails>> getPatientsList();
  Future<PatientsDetails?> getPatientDetails(String patientId);
  Future<void> deletePatientDetails(String patientId);
  Future<void> addLabFile(PatientsDetails patient, File file, String name,String fileExtension);
}
