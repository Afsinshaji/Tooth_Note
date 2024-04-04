part of 'bookings_bloc.dart';

@freezed
class BookingsEvent with _$BookingsEvent {
  const factory BookingsEvent.addBookingsPatient(
      {required BookingsDTO patient}) = addBookingsPatient;
       const factory BookingsEvent.addNewBookingsPatient(
      {required BookingsDTO patient}) = addNewBookingsPatient;
  const factory BookingsEvent.getBookingsPatientsDetails(
      {required String patientId}) = getBookingsPatientsDetails;
      const factory BookingsEvent.deleteBookingsPatientDetail({required String patientId}) =
      deleteBookingsPatientDetail;
}
