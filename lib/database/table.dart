import 'dart:convert';
import 'package:drift/drift.dart';

import '../data/models/application_status.dart';
import '../data/models/job_application_details.dart';
import '../data/models/job_type.dart';
import '../data/models/opportunity_type.dart';
import '../data/models/work_flexibility.dart';


@UseRowClass(ApplicationDetails)
class ApplicationEntries extends Table with AutoIncrementingPrimaryKey {
  TextColumn get company => text()();

  TextColumn get role => text()();

  TextColumn get location => text().nullable()();

  TextColumn get jobPostUrl => text().nullable()();

  TextColumn get companyUrl => text().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get applicationDate => dateTime().nullable()();

  TextColumn get status => textEnum<ApplicationStatus>()();

  TextColumn get type => textEnum<JobType>().nullable()();

  TextColumn get opportunity => textEnum<OpportunityType>().nullable()();

  TextColumn get flexibility => textEnum<WorkFlexibility>().nullable()();

  TextColumn get salaryRange =>
      text().map(const SalaryRangeConverter()).nullable()();

  TextColumn get statusEvents => text().map(const StatusEventConverter()).nullable()();
}

mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}

class Contact {}

class FollowUp {}

class Interview {}

class SalaryRange {
  final double? minSalary;
  final double? maxSalary;

  SalaryRange({this.minSalary, this.maxSalary});

  factory SalaryRange.fromJson(Map<String, dynamic> json) {
    return SalaryRange(
      minSalary: json['minSalary'] as double?,
      maxSalary: json['maxSalary'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'minSalary': minSalary,
      'maxSalary': maxSalary,
    };
  }
}

class SalaryRangeConverter extends TypeConverter<SalaryRange, String> {
  const SalaryRangeConverter();

  @override
  SalaryRange fromSql(String fromDb) {
    return SalaryRange.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(SalaryRange value) {
    return json.encode(value.toJson());
  }
}

class StatusEvent {
  final ApplicationStatus status;
  final DateTime timestamp;
  final int? round;

  StatusEvent({
    required this.status,
    required this.timestamp,
    this.round,
  });
}

class StatusEventConverter extends TypeConverter<Set<StatusEvent>, String> {
  const StatusEventConverter();

  @override
  Set<StatusEvent> fromSql(String fromDb) {
    final List<dynamic> decoded = json.decode(fromDb);

    return decoded.map((e) {
      return StatusEvent(
        status: ApplicationStatus.values[e['status'] as int],
        timestamp: DateTime.parse(e['timestamp'] as String),
        round: e['round'] as int?,
      );
    }).toSet();
  }

  @override
  String toSql(Set<StatusEvent> value) {
    final List<Map<String, dynamic>> encoded = value.map((e) {
      return {
        'status': e.status.index,
        'timestamp': e.timestamp.toIso8601String(),
        'round': e.round,
      };
    }).toList();
    return json.encode(encoded);
  }
}


