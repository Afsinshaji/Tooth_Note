import 'package:tooth_note/domain/models/examination_details/examination_details.dart';

class ExaminationDetailsDTO {
  final String patientId;
  final List<dynamic> examinationDetails;

  ExaminationDetailsDTO(
      {required this.patientId, required this.examinationDetails});
static  ExaminationDetailsDTO? fromModel(ExaminationDetails? history) {
  if (history == null) {
      return null;
    }
     final list = history.examinationDetails;
   
    return ExaminationDetailsDTO(
        patientId: history.patientId,
        examinationDetails: list );
  }

  ExaminationDetails toModel() {
    return ExaminationDetails(patientId: patientId, examinationDetails: examinationDetails);
  }
}
