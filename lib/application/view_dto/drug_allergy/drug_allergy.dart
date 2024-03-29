import 'package:tooth_note/domain/models/drug_allergy/drug_allergy.dart';

class DrugAllergyDTO {
  final String patientId;
  final String drugAllergy;

  DrugAllergyDTO({required this.patientId, required this.drugAllergy});
static DrugAllergyDTO? fromModel(DrugAllergy? history) {
  if (history == null) {
      return null;
    }
    return DrugAllergyDTO(
        patientId: history.patientId,
        drugAllergy: history.drugAllergy);
  }

  DrugAllergy toModel() {
    return DrugAllergy(patientId: patientId, drugAllergy: drugAllergy);
  }
}
