import 'package:job_trackr/data/models/constants.dart';

import '../../database/table.dart';

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

/* factory JobApplication.fromMap(Map<String, dynamic> map) {
    return JobApplication(
        id: map[columnId] as int,
        title: map[columnTitle] as String,
        enterpriseName: map[columnEnterpriseName] as String,
        applicationDate: _dateFromMap(map[columnApplicationDate] as int),
        status: _applicationStatusEnumMap[map[columnStatus] as String] ??
            ApplicationStatus.applied,
        location: map[columnLocationName]??'');
  } */

/*static int _dateToJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _dateFromMap(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value);*/
}

/*const _applicationStatusEnumMap = {
  'planned': ApplicationStatus.planned,
  'sent': ApplicationStatus.sent,
  'viewed': ApplicationStatus.viewed,
  'waitingForInterviewFeedback': ApplicationStatus.waitingForInterviewFeedback,
  'proposition': ApplicationStatus.proposition,
  'refused': ApplicationStatus.refused,
  'accepted': ApplicationStatus.accepted,
};*/
