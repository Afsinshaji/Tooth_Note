import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tooth_note/domain/models/lab_investigation/lab_investigation.dart';
import 'package:tooth_note/domain/models/patients/patients.dart';
import 'package:tooth_note/domain/repositories/patients/patients_repository.dart';

class PatientsImplementation extends PatientsRepository {
  // creating a singleton
  PatientsImplementation.internal();
  static PatientsImplementation instance = PatientsImplementation.internal();
  PatientsImplementation factory() {
    return instance;
  }

///////////////////////////////////////////
  @override
  Future<void> addPatientdetails(PatientsDetails patient) async {
    final patientCollection = FirebaseFirestore.instance.collection('patients');
    final patientDoc = patientCollection.doc(patient.patientId);
    final patientMap = patient.toMap();
    await patientDoc.set(patientMap);
  }

  @override
  Future<void> addLabFile(PatientsDetails patient, File file, String name,
      String fileExtension) async {
    final url = await uploadFile(file, name, fileExtension);
    List labFileList = [];
    if (patient.labInvestigation != null) {
      labFileList = patient.labInvestigation!.labInvestigation;
    }
    labFileList.add({'name': name, 'url': url});
    final newlabModel = LabInvestigation(
        patientId: patient.patientId, labInvestigation: labFileList);
    final newPatientModel = PatientsDetails(
      doctor: patient.doctor,
      medicine: patient.medicine,
      dob: patient.dob ,
      newAppointment: patient.newAppointment,
        patientName: patient.patientName,
        patientNumber: patient.patientNumber,
        address: patient.address,
        phoneNumber: patient.phoneNumber,
        age: patient.age,
        sex: patient.sex,
        patientId: patient.patientId,
        chiefComplaints: patient.chiefComplaints,
        drugAllergy: patient.drugAllergy,
        drughistory: patient.drughistory,
        examinationDetails: patient.examinationDetails,
        medicalHistory: patient.medicalHistory,
        pastDentalHistory: patient.pastDentalHistory,
        points: patient.points,
        payments: patient.payments,
        treatmentDetails: patient.treatmentDetails,
        treatmentPlanning: patient.treatmentPlanning,
        labInvestigation: newlabModel,
        diagnosis: patient.diagnosis,
        date: patient.date);

    await addPatientdetails(newPatientModel);
  }

  @override
  Future<void> deletePatientDetails(String patientId) async {
    final patientCollection = FirebaseFirestore.instance.collection('patients');
    final patientDoc = patientCollection.doc(patientId);

    await patientDoc.delete();
  }

  @override
  Future<PatientsDetails?> getPatientDetails(String patientId) async {
    final patientCollection = FirebaseFirestore.instance.collection('patients');
    final patientDoc = patientCollection.doc(patientId);
    final patientMap = await patientDoc.get();
    if (patientMap.data() != null) {
      final patientDetails = PatientsDetails.fromMap(patientMap.data()!);
      
      return patientDetails;
    }
    return null;
  }

  @override
  Future<List<PatientsDetails>> getPatientsList() async {
    final patientCollection = FirebaseFirestore.instance.collection('patients');
    final List<PatientsDetails> listOfPatients = [];

    final patientDocs = await patientCollection.get();
    if (patientDocs.docs.isNotEmpty) {
      for (var doc in patientDocs.docs) {
        final patientDetails = PatientsDetails.fromMap(doc.data());
        listOfPatients.add(patientDetails);
      }
    }
    return listOfPatients;
  }

  Future<String> uploadFile(
      File file, String name, String fileExtension) async {
    DateTime now = DateTime.now();
    String timeStamp = now.microsecondsSinceEpoch.toString();
    final storage = FirebaseStorage.instance;
    final storageRef = storage.ref();
    String extension = fileExtension;
    if (extension.isEmpty) {
      extension = file.path;
    }
    final imageRef = storageRef.child("$timeStamp.$extension");

    // log(imageRef.toString());
    // log(file.toString());
    final task = await imageRef.putFile(file);

    final String downloadUrl = await task.ref.getDownloadURL();
    return downloadUrl;
  }
}
