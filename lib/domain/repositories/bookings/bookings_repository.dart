

import 'package:tooth_note/domain/models/bookings/bookings.dart';


abstract class BookingsRepository {
  Future<void> addBookingPatientdetails(Bookings patient);
  Future<List<Bookings>> getBookingPatientsList();
  Future<Bookings?> getBookingPatientDetails(String patientId);
  Future<void> deleteBookingPatientDetails(String patientId);

}
