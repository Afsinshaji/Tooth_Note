import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tooth_note/application/view_dto/booking/booking.dart';
import 'package:tooth_note/infrastructure/bookings/bookings_implementation.dart';

part 'all_bookings_event.dart';
part 'all_bookings_state.dart';
part 'all_bookings_bloc.freezed.dart';

class AllBookingsBloc extends Bloc<AllBookingsEvent, AllBookingsState> {
  AllBookingsBloc() : super(const allBookingsInitial()) {
    on<getBookedPatientList>((event, emit) async {
      List<BookingsDTO> patientListDTO = [];
      final patientList =
          await BookingsImplementation.instance.getBookingPatientsList();
      for (var patient in patientList) {
        patientListDTO.add(BookingsDTO.fromModel(patient));
      }

      emit(displayAllBookedPatient(patient: patientListDTO));
    });
  }
}
