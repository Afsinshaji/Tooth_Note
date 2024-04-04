part of 'bookings_bloc.dart';

@freezed
class BookingsState with _$BookingsState {
  const factory BookingsState.bookingInitial() = bookingInitial;
 const factory BookingsState.displayBookedPatient(
      {required BookingsDTO patient,
      required bool isLoading}) = displayPatient; 
}
