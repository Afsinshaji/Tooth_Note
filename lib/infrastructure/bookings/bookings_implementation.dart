import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tooth_note/domain/models/bookings/bookings.dart';

import 'package:tooth_note/domain/repositories/bookings/bookings_repository.dart';

class BookingsImplementation extends BookingsRepository {
  // creating a singleton
  BookingsImplementation.internal();
  static BookingsImplementation instance = BookingsImplementation.internal();
  BookingsImplementation factory() {
    return instance;
  }

///////////////////////////////////////////
  @override
  Future<void> addBookingPatientdetails(Bookings patient) async {
    final patientCollection = FirebaseFirestore.instance.collection('bookings');
    final patientDoc = patientCollection.doc(patient.patientId);
    final patientMap = patient.toMap();
    await patientDoc.set(patientMap);
  }

  @override
  Future<void> deleteBookingPatientDetails(String patientId) async {
    final patientCollection = FirebaseFirestore.instance.collection('bookings');
    final patientDoc = patientCollection.doc(patientId);

    await patientDoc.delete();
  }

  @override
  Future<Bookings?> getBookingPatientDetails(String patientId) async {
    final patientCollection = FirebaseFirestore.instance.collection('bookings');
    final patientDoc = patientCollection.doc(patientId);
    final patientMap = await patientDoc.get();
    if (patientMap.data() != null) {
      final patientDetails = Bookings.fromMap(patientMap.data()!);

      return patientDetails;
    }
    return null;
  }

  @override
  Future<List<Bookings>> getBookingPatientsList() async {
    final patientCollection = FirebaseFirestore.instance.collection('bookings');
    final List<Bookings> listOfPatients = [];

    final patientDocs = await patientCollection.get();
    if (patientDocs.docs.isNotEmpty) {
      for (var doc in patientDocs.docs) {
        final patientDetails = Bookings.fromMap(doc.data());
        listOfPatients.add(patientDetails);
      }
    }
    return listOfPatients;
  }
}
