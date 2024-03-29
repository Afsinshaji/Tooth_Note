import 'package:tooth_note/domain/models/points/points.dart';

class PointsDTO {
  final String patientId;
  final List<dynamic> points;

  PointsDTO({required this.patientId, required this.points});
static PointsDTO? fromModel(Points? history) {
  if (history == null) {
      return null;
    }
     final list = history.points;
   
    return PointsDTO(
        patientId: history.patientId,
        points:list );
  }

  Points toModel() {
    return Points(patientId: patientId, points: points);
  }
}
