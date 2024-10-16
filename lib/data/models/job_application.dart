import 'package:job_trackr/data/models/application_status.dart';

class JobApplication {
  final int id;
  final String title;
  final String enterpriseName;
  final DateTime applicationDate;
  final ApplicationStatus status;

  JobApplication({
    required this.status,
    required this.id,
    required this.title,
    required this.enterpriseName,
    required this.applicationDate,
  });

  factory JobApplication.fromMap(Map<String, dynamic> map) {
    return JobApplication(
      id: map['_id'] as int,
      title: map['title'] as String,
      enterpriseName: map['enterprise_name'] as String,
      applicationDate: _dateFromMap(map['application_date'] as int),
      status: _applicationStatusEnumMap[map['status'] as String] ??
          ApplicationStatus.sent,
    );
  }

  static int _dateToJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _dateFromMap(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value);
}

const _applicationStatusEnumMap = {
  'planned': ApplicationStatus.planned,
  'sent': ApplicationStatus.sent,
  'viewed': ApplicationStatus.viewed,
  'waitingForInterviewFeedback': ApplicationStatus.waitingForInterviewFeedback,
  'proposition': ApplicationStatus.proposition,
  'refused': ApplicationStatus.refused,
  'accepted': ApplicationStatus.accepted,
};
