import 'package:tooth_note/domain/models/payments/payments.dart';


class PaymentsDTO {
  final String patientId;
  final List<dynamic> payments;

  PaymentsDTO({required this.patientId, required this.payments});
static PaymentsDTO? fromModel(Payments? history) {
  if (history == null) {
      return null;
    }
     final list = history.payments;
   
    return PaymentsDTO(
        patientId: history.patientId,
        payments:list );
  }

  Payments toModel() {
    return Payments(patientId: patientId, payments: payments);
  }
}
