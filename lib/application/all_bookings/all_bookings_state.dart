part of 'all_bookings_bloc.dart';

@freezed
class AllBookingsState with _$AllBookingsState {
  const factory AllBookingsState.allBookingsInitial() = allBookingsInitial;
  const factory AllBookingsState.displayAllBookedPatient(
      {required List<BookingsDTO> patient}) = displayAllBookedPatient;
}
