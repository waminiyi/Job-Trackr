// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApplicationDetails _$JobApplicationFromJson(Map<String, dynamic> json) =>
    JobApplicationDetails(
      id: (json['_id'] as num?)?.toInt(),
      title: json['title'] as String,
      enterpriseName: json['enterprise_name'] as String,
      applicationDate: JobApplicationDetails._dateFromJson(
          (json['application_date'] as num).toInt()),
      applicationType:
          $enumDecode(_$ApplicationTypeEnumMap, json['application_type']),
      status: $enumDecode(_$ApplicationStatusEnumMap, json['status']),
      statusDates:
          JobApplicationDetails._statusDatesFromJson(json['status_dates'] as String),
      jobBoardName: json['job_board_name'] as String?,
      jobPostLink: json['job_post_link'] as String?,
      enterpriseLink: json['enterprise_link'] as String?,
      locationName: json['location_name'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$JobApplicationToJson(JobApplicationDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'enterprise_name': instance.enterpriseName,
      'application_date': JobApplicationDetails._dateToJson(instance.applicationDate),
      'application_type': _$ApplicationTypeEnumMap[instance.applicationType]!,
      'status': _$ApplicationStatusEnumMap[instance.status]!,
      'status_dates': JobApplicationDetails._statusDatesToJson(instance.statusDates),
      'job_board_name': instance.jobBoardName,
      'job_post_link': instance.jobPostLink,
      'enterprise_link': instance.enterpriseLink,
      'location_name': instance.locationName,
      'note': instance.note,
    };

const _$ApplicationTypeEnumMap = {
  ApplicationType.jobPost: 'jobPost',
  ApplicationType.referral: 'referral',
  ApplicationType.internalTransfer: 'internalTransfer',
  ApplicationType.recruitmentAgency: 'recruitmentAgency',
  ApplicationType.other: 'other',
};

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.planned: 'planned',
  ApplicationStatus.sent: 'sent',
  ApplicationStatus.viewed: 'viewed',
  ApplicationStatus.waitingForInterviewFeedback: 'waitingForInterviewFeedback',
  ApplicationStatus.proposition: 'proposition',
  ApplicationStatus.refused: 'refused',
  ApplicationStatus.accepted: 'accepted',
};
