import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tooth_note/application/view_dto/booking/booking.dart';
import 'package:tooth_note/infrastructure/bookings/bookings_implementation.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';
part 'bookings_bloc.freezed.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(const bookingInitial()) {
    on<addNewBookingsPatient>((event, emit) async {
      await BookingsImplementation.instance
          .addBookingPatientdetails(event.patient.toModel());
      // add(getBookingsPatientsDetails(patientId: event.patient.patientId));
    });
    on<addBookingsPatient>((event, emit) async {
      await BookingsImplementation.instance
          .addBookingPatientdetails(event.patient.toModel());
      add(getBookingsPatientsDetails(patientId: event.patient.patientId));
    });

    on<getBookingsPatientsDetails>((event, emit) async {
      final patient = await BookingsImplementation.instance
          .getBookingPatientDetails(event.patientId);
      if (patient != null) {
        emit(
          displayPatient(
              patient: BookingsDTO.fromModel(patient), isLoading: false),
        );
      }
    });

    on<deleteBookingsPatientDetail>((event, emit) async {
      await BookingsImplementation.instance
          .deleteBookingPatientDetails(event.patientId);
      add(getBookingsPatientsDetails(patientId: event.patientId));
    });
  }
}
