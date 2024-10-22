import 'package:job_trackr/data/models/work_flexibility.dart';

import 'application_status.dart';

class JobApplication {
  final int id;
  final String role;
  final String company;
  final DateTime? applicationDate;
  final ApplicationStatus status;
  final WorkFlexibility? flexibility;
  final String? location;

  JobApplication({
    required this.id,
    required this.role,
    required this.company,
    this.applicationDate,
    this.flexibility,
    required this.status,
    this.location,
  });
}
