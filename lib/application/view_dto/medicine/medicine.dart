import 'package:tooth_note/domain/models/medicine/medicine.dart';


class MedicineDTO {
  final String patientId;
  final String medicine;

  MedicineDTO(
      {required this.patientId, required this.medicine});
 static MedicineDTO? fromModel(Medicine? history) {
  if (history == null) {
      return null;
    }
    return MedicineDTO(
        patientId: history.patientId,
        medicine: history.medicine);
  }

  Medicine toModel() {
    return Medicine(
        patientId: patientId, medicine: medicine);
  }
}
