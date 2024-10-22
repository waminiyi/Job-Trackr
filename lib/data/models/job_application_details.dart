import 'package:job_trackr/data/models/work_flexibility.dart';

import '../../database/table.dart';
import 'application_status.dart';
import 'job_type.dart';
import 'opportunity_type.dart';

class ApplicationDetails {
  final int id;
  final String company;
  final String role;
  final String? location;
  final String? jobPostUrl;
  final String? companyUrl;
  final String? note;
  final DateTime? applicationDate;
  final ApplicationStatus status;
  final JobType? type;
  final OpportunityType? opportunity;
  final WorkFlexibility? flexibility;
  final SalaryRange? salaryRange;
  final Set<StatusEvent>? statusEvents;

  ApplicationDetails({
    required this.id,
    required this.company,
    required this.role,
    this.location,
    this.jobPostUrl,
    this.companyUrl,
    this.note,
    this.applicationDate,
    required this.status,
    this.type,
    this.opportunity,
    this.flexibility,
    this.salaryRange,
    this.statusEvents,
  });
}
