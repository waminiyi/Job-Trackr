
import 'application_status.dart';

class JobApplication {
  final int id;
  final String title;
  final String enterpriseName;
  final DateTime applicationDate;
  final ApplicationStatus status;
  final String location;

  JobApplication({
    required this.id,
    required this.title,
    required this.enterpriseName,
    required this.applicationDate,
    required this.status,
    required this.location,
  });

}

