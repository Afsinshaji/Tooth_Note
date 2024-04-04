import 'package:tooth_note/domain/models/bookings/bookings.dart';

class BookingsDTO {
  final String patientId;
  final String patientName;
  final String timeSlot;
  final String phNumber;
  final String procedure;
  final String remarks;
  final String date;
  final String address;

  BookingsDTO({
    required this.patientId,
    required this.patientName,
    required this.phNumber,
    required this.procedure,
    required this.remarks,
    required this.timeSlot,
    required this.date,
    required this.address,
  });
  static BookingsDTO fromModel(Bookings booking) {
    return BookingsDTO(
      patientId: booking.patientId,
      patientName: booking.patientName,
      phNumber: booking.phNumber,
      procedure: booking.procedure,
      remarks: booking.remarks,
      timeSlot: booking.timeSlot,
      date: booking.date,
      address: booking.address,
    );
  }

  Bookings toModel() {
    return Bookings(
      patientId: patientId,
      patientName: patientName,
      phNumber: phNumber,
      procedure: procedure,
      remarks: remarks,
      date: date,
      address: address,
      timeSlot: timeSlot,
    );
  }
}
