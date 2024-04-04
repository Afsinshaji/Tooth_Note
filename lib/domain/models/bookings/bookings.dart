class Bookings {
  final String patientId;
  final String patientName;
  final String timeSlot;
  final String phNumber;
  final String procedure;
  final String remarks;
  final String address;
  final String date;

  Bookings({
    required this.patientId,
    required this.patientName,
    required this.phNumber,
    required this.procedure,
    required this.remarks,
    required this.timeSlot,
    required this.date,
    required this.address,
  });
  static Bookings fromMap(Map<String, dynamic> booking) {
    return Bookings(
      patientId: booking['patientId'],
      patientName: booking['patientName'],
      phNumber: booking['phNumber'],
      procedure: booking['procedure'],
      remarks: booking['remarks'],
      timeSlot: booking['timeSlot'],
      date: booking['date'],
      address: booking['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'patientId': patientId,
      'patientName': patientName,
      'phNumber': phNumber,
      'procedure': procedure,
      'remarks': remarks,
      'timeSlot': timeSlot,
      'date': date,
      'address': address,
    };
  }
}
