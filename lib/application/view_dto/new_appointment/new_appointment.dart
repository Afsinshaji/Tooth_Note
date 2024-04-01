
import 'package:tooth_note/domain/models/new_appointment/new_appointment.dart';

class NewAppointmentDTO {
  final String patientId;
  final List<dynamic> newAppointment;

  NewAppointmentDTO({required this.patientId, required this.newAppointment});
  static NewAppointmentDTO? fromModel(NewAppointment? history) {
    if (history == null) {
      return null;
    }
    final list =history.newAppointment;
    
      return NewAppointmentDTO(
          patientId: history.patientId, 
          newAppointment: list);
 
  }

  NewAppointment toModel() {
    return NewAppointment(patientId: patientId, newAppointment: newAppointment);
  }
}
