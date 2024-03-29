import 'dart:developer';

import 'package:tooth_note/domain/models/chief_complaints/chief_complaints.dart';

class ChiefComplaintsDTO {
  final String patientId;
  final List<dynamic> chiefComplaints;

  ChiefComplaintsDTO({required this.patientId, required this.chiefComplaints});
  static ChiefComplaintsDTO? fromModel(ChiefComplaints? complaint) {
    if (complaint == null) {
      return null;
    }
 final list = complaint.chiefComplaints;
   
      log('in');
      return ChiefComplaintsDTO(
          patientId: complaint.patientId, chiefComplaints: list);
  
    
  }

  ChiefComplaints toModel() {
    return ChiefComplaints(
        patientId: patientId, chiefComplaints: chiefComplaints);
  }
}
