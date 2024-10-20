/*
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'application_status.dart';
import 'application_type.dart';
import 'constants.dart';

part 'job_application.g.dart';

@JsonSerializable()
class JobApplicationDetails {
  @JsonKey(name: columnId)
  int? id;
  @JsonKey(name: columnTitle)
  String title = '';
  @JsonKey(name: columnEnterpriseName)
  String enterpriseName = '';
  @JsonKey(
    name: columnApplicationDate,
    toJson: _dateToJson,
    fromJson: _dateFromJson,
  )
  DateTime applicationDate = DateTime.now();
  @JsonKey(name: columnApplicationType)
  ApplicationType applicationType = ApplicationType.jobPost;
  @JsonKey(name: columnStatus)
  ApplicationStatus status = ApplicationStatus.planned;
  @JsonKey(
    name: columnStatusDates,
    toJson: _statusDatesToJson,
    fromJson: _statusDatesFromJson,
  )  Map<ApplicationStatus, DateTime> statusDates = {};
  @JsonKey(name: columnJobBoardName)
  String? jobBoardName;
  @JsonKey(name: columnJobPostLink)
  String? jobPostLink;
  @JsonKey(name: columnEnterpriseLink)
  String? enterpriseLink;
  @JsonKey(name: columnLocationName)
  String? locationName;
  @JsonKey(name: columnNote)
  String? note;

  JobApplicationDetails({
    this.id,
    required this.title,
    required this.enterpriseName,
    required this.applicationDate,
    required this.applicationType,
    required this.status,
    required this.statusDates,
    this.jobBoardName,
    this.jobPostLink,
    this.enterpriseLink,
    this.locationName,
    this.note,
  });

  static int _dateToJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _dateFromJson(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value);

  // Custom statusDates serialization to string (for saving to the database)
  static String _statusDatesToJson(Map<ApplicationStatus, DateTime> statusDates) {
    final map = statusDates.map((status, date) =>
        MapEntry(status.index.toString(), date.millisecondsSinceEpoch));
    return jsonEncode(map); // Convert to JSON string
  }

  // Custom statusDates deserialization from string (for loading from the database)
  static Map<ApplicationStatus, DateTime> _statusDatesFromJson(String jsonString) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString); // Convert from JSON string
    return jsonMap.map((key, value) =>
        MapEntry(ApplicationStatus.values[int.parse(key)], DateTime.fromMillisecondsSinceEpoch(value as int)));
  }

  /// Connect the generated [_$JobApplicationFromJson] function to the `fromJson`
  /// factory.
  factory JobApplicationDetails.fromMap(Map<String, dynamic> json) => _$JobApplicationFromJson(json);


  /// Connect the generated [_$JobApplicationToJson] function to the `toJson` method.
  Map<String, dynamic> toMap() => _$JobApplicationToJson(this);

  // Convert the JobApplication object into a map for database storage
  */
/*Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnEnterpriseName: enterpriseName,
      columnApplicationDate: applicationDate.toIso8601String(),
      columnApplicationType: applicationType.index,
      columnStatus: status.index,
      columnStatusDates: _statusDatesToMap(),
      columnJobBoardName: jobBoardName,
      columnJobPostLink: jobPostLink,
      columnEnterpriseLink: enterpriseLink,
      columnLocationName: locationName,
      columnNote: note,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }*//*


  // Helper function to convert statusDates map to savable format
  */
/*Map<String, String> _statusDatesToMap() {
    return statusDates.map((status, date) =>
        MapEntry(status.index.toString(), date.toIso8601String()));
  }
*//*

  // Helper function to parse status dates from a map
  Map<ApplicationStatus, DateTime> _mapToStatusDates(Map<String, Object?> map) {
    return map.map((statusIndex, date) => MapEntry(
        ApplicationStatus.values[int.parse(statusIndex)],
        DateTime.parse(date as String)));
  }

// Create a JobApplication object from a map (retrieved from the database)
*/
/*  JobApplication.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int?;
    title = map[columnTitle] as String;
    enterpriseName = map[columnEnterpriseName] as String;
    // Handle applicationDate safely
    if (map[columnApplicationDate] != null) {
      applicationDate = DateTime.parse(map[columnApplicationDate] as String);
    } else {
      applicationDate =
          DateTime.now(); // Or handle it differently based on your logic
    }
    applicationType = ApplicationType.values[0];
    status = ApplicationStatus.values[0];
    statusDates =
        _mapToStatusDates(map[columnStatusDates] as Map<String, Object?>);

    // Nullable fields
    jobBoardName = map[columnJobBoardName] as String?;
    jobPostLink = map[columnJobPostLink] as String?;
    enterpriseLink = map[columnEnterpriseLink] as String?;
    locationName = map[columnLocationName] as String?;
    note = map[columnNote] as String?;
  }*//*

}
*/
