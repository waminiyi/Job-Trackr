// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ApplicationEntriesTable extends ApplicationEntries
    with TableInfo<$ApplicationEntriesTable, ApplicationDetails> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApplicationEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _companyMeta =
      const VerificationMeta('company');
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
      'company', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _jobPostUrlMeta =
      const VerificationMeta('jobPostUrl');
  @override
  late final GeneratedColumn<String> jobPostUrl = GeneratedColumn<String>(
      'job_post_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _companyUrlMeta =
      const VerificationMeta('companyUrl');
  @override
  late final GeneratedColumn<String> companyUrl = GeneratedColumn<String>(
      'company_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _applicationDateMeta =
      const VerificationMeta('applicationDate');
  @override
  late final GeneratedColumn<DateTime> applicationDate =
      GeneratedColumn<DateTime>('application_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<ApplicationStatus, String>
      status = GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ApplicationStatus>(
              $ApplicationEntriesTable.$converterstatus);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<JobType?, String> type =
      GeneratedColumn<String>('type', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<JobType?>($ApplicationEntriesTable.$convertertypen);
  static const VerificationMeta _opportunityMeta =
      const VerificationMeta('opportunity');
  @override
  late final GeneratedColumnWithTypeConverter<OpportunityType?, String>
      opportunity = GeneratedColumn<String>('opportunity', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<OpportunityType?>(
              $ApplicationEntriesTable.$converteropportunityn);
  static const VerificationMeta _flexibilityMeta =
      const VerificationMeta('flexibility');
  @override
  late final GeneratedColumnWithTypeConverter<WorkFlexibility?, String>
      flexibility = GeneratedColumn<String>('flexibility', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<WorkFlexibility?>(
              $ApplicationEntriesTable.$converterflexibilityn);
  static const VerificationMeta _salaryRangeMeta =
      const VerificationMeta('salaryRange');
  @override
  late final GeneratedColumnWithTypeConverter<SalaryRange?, String>
      salaryRange = GeneratedColumn<String>('salary_range', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<SalaryRange?>(
              $ApplicationEntriesTable.$convertersalaryRangen);
  static const VerificationMeta _statusEventsMeta =
      const VerificationMeta('statusEvents');
  @override
  late final GeneratedColumnWithTypeConverter<Set<StatusEvent>?, String>
      statusEvents = GeneratedColumn<String>('status_events', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Set<StatusEvent>?>(
              $ApplicationEntriesTable.$converterstatusEventsn);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        company,
        role,
        location,
        jobPostUrl,
        companyUrl,
        note,
        applicationDate,
        status,
        type,
        opportunity,
        flexibility,
        salaryRange,
        statusEvents
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'application_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ApplicationDetails> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('job_post_url')) {
      context.handle(
          _jobPostUrlMeta,
          jobPostUrl.isAcceptableOrUnknown(
              data['job_post_url']!, _jobPostUrlMeta));
    }
    if (data.containsKey('company_url')) {
      context.handle(
          _companyUrlMeta,
          companyUrl.isAcceptableOrUnknown(
              data['company_url']!, _companyUrlMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('application_date')) {
      context.handle(
          _applicationDateMeta,
          applicationDate.isAcceptableOrUnknown(
              data['application_date']!, _applicationDateMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_opportunityMeta, const VerificationResult.success());
    context.handle(_flexibilityMeta, const VerificationResult.success());
    context.handle(_salaryRangeMeta, const VerificationResult.success());
    context.handle(_statusEventsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ApplicationDetails map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ApplicationDetails(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      jobPostUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_post_url']),
      companyUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_url']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      applicationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}application_date']),
      status: $ApplicationEntriesTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      type: $ApplicationEntriesTable.$convertertypen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])),
      opportunity: $ApplicationEntriesTable.$converteropportunityn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}opportunity'])),
      flexibility: $ApplicationEntriesTable.$converterflexibilityn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}flexibility'])),
      salaryRange: $ApplicationEntriesTable.$convertersalaryRangen.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}salary_range'])),
      statusEvents: $ApplicationEntriesTable.$converterstatusEventsn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}status_events'])),
    );
  }

  @override
  $ApplicationEntriesTable createAlias(String alias) {
    return $ApplicationEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ApplicationStatus, String, String>
      $converterstatus =
      const EnumNameConverter<ApplicationStatus>(ApplicationStatus.values);
  static JsonTypeConverter2<JobType, String, String> $convertertype =
      const EnumNameConverter<JobType>(JobType.values);
  static JsonTypeConverter2<JobType?, String?, String?> $convertertypen =
      JsonTypeConverter2.asNullable($convertertype);
  static JsonTypeConverter2<OpportunityType, String, String>
      $converteropportunity =
      const EnumNameConverter<OpportunityType>(OpportunityType.values);
  static JsonTypeConverter2<OpportunityType?, String?, String?>
      $converteropportunityn =
      JsonTypeConverter2.asNullable($converteropportunity);
  static JsonTypeConverter2<WorkFlexibility, String, String>
      $converterflexibility =
      const EnumNameConverter<WorkFlexibility>(WorkFlexibility.values);
  static JsonTypeConverter2<WorkFlexibility?, String?, String?>
      $converterflexibilityn =
      JsonTypeConverter2.asNullable($converterflexibility);
  static TypeConverter<SalaryRange, String> $convertersalaryRange =
      const SalaryRangeConverter();
  static TypeConverter<SalaryRange?, String?> $convertersalaryRangen =
      NullAwareTypeConverter.wrap($convertersalaryRange);
  static TypeConverter<Set<StatusEvent>, String> $converterstatusEvents =
      const StatusEventConverter();
  static TypeConverter<Set<StatusEvent>?, String?> $converterstatusEventsn =
      NullAwareTypeConverter.wrap($converterstatusEvents);
}

class ApplicationEntriesCompanion extends UpdateCompanion<ApplicationDetails> {
  final Value<int> id;
  final Value<String> company;
  final Value<String> role;
  final Value<String?> location;
  final Value<String?> jobPostUrl;
  final Value<String?> companyUrl;
  final Value<String?> note;
  final Value<DateTime?> applicationDate;
  final Value<ApplicationStatus> status;
  final Value<JobType?> type;
  final Value<OpportunityType?> opportunity;
  final Value<WorkFlexibility?> flexibility;
  final Value<SalaryRange?> salaryRange;
  final Value<Set<StatusEvent>?> statusEvents;
  const ApplicationEntriesCompanion({
    this.id = const Value.absent(),
    this.company = const Value.absent(),
    this.role = const Value.absent(),
    this.location = const Value.absent(),
    this.jobPostUrl = const Value.absent(),
    this.companyUrl = const Value.absent(),
    this.note = const Value.absent(),
    this.applicationDate = const Value.absent(),
    this.status = const Value.absent(),
    this.type = const Value.absent(),
    this.opportunity = const Value.absent(),
    this.flexibility = const Value.absent(),
    this.salaryRange = const Value.absent(),
    this.statusEvents = const Value.absent(),
  });
  ApplicationEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String company,
    required String role,
    this.location = const Value.absent(),
    this.jobPostUrl = const Value.absent(),
    this.companyUrl = const Value.absent(),
    this.note = const Value.absent(),
    this.applicationDate = const Value.absent(),
    required ApplicationStatus status,
    this.type = const Value.absent(),
    this.opportunity = const Value.absent(),
    this.flexibility = const Value.absent(),
    this.salaryRange = const Value.absent(),
    this.statusEvents = const Value.absent(),
  })  : company = Value(company),
        role = Value(role),
        status = Value(status);
  static Insertable<ApplicationDetails> custom({
    Expression<int>? id,
    Expression<String>? company,
    Expression<String>? role,
    Expression<String>? location,
    Expression<String>? jobPostUrl,
    Expression<String>? companyUrl,
    Expression<String>? note,
    Expression<DateTime>? applicationDate,
    Expression<String>? status,
    Expression<String>? type,
    Expression<String>? opportunity,
    Expression<String>? flexibility,
    Expression<String>? salaryRange,
    Expression<String>? statusEvents,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (company != null) 'company': company,
      if (role != null) 'role': role,
      if (location != null) 'location': location,
      if (jobPostUrl != null) 'job_post_url': jobPostUrl,
      if (companyUrl != null) 'company_url': companyUrl,
      if (note != null) 'note': note,
      if (applicationDate != null) 'application_date': applicationDate,
      if (status != null) 'status': status,
      if (type != null) 'type': type,
      if (opportunity != null) 'opportunity': opportunity,
      if (flexibility != null) 'flexibility': flexibility,
      if (salaryRange != null) 'salary_range': salaryRange,
      if (statusEvents != null) 'status_events': statusEvents,
    });
  }

  ApplicationEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? company,
      Value<String>? role,
      Value<String?>? location,
      Value<String?>? jobPostUrl,
      Value<String?>? companyUrl,
      Value<String?>? note,
      Value<DateTime?>? applicationDate,
      Value<ApplicationStatus>? status,
      Value<JobType?>? type,
      Value<OpportunityType?>? opportunity,
      Value<WorkFlexibility?>? flexibility,
      Value<SalaryRange?>? salaryRange,
      Value<Set<StatusEvent>?>? statusEvents}) {
    return ApplicationEntriesCompanion(
      id: id ?? this.id,
      company: company ?? this.company,
      role: role ?? this.role,
      location: location ?? this.location,
      jobPostUrl: jobPostUrl ?? this.jobPostUrl,
      companyUrl: companyUrl ?? this.companyUrl,
      note: note ?? this.note,
      applicationDate: applicationDate ?? this.applicationDate,
      status: status ?? this.status,
      type: type ?? this.type,
      opportunity: opportunity ?? this.opportunity,
      flexibility: flexibility ?? this.flexibility,
      salaryRange: salaryRange ?? this.salaryRange,
      statusEvents: statusEvents ?? this.statusEvents,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (jobPostUrl.present) {
      map['job_post_url'] = Variable<String>(jobPostUrl.value);
    }
    if (companyUrl.present) {
      map['company_url'] = Variable<String>(companyUrl.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (applicationDate.present) {
      map['application_date'] = Variable<DateTime>(applicationDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $ApplicationEntriesTable.$converterstatus.toSql(status.value));
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $ApplicationEntriesTable.$convertertypen.toSql(type.value));
    }
    if (opportunity.present) {
      map['opportunity'] = Variable<String>($ApplicationEntriesTable
          .$converteropportunityn
          .toSql(opportunity.value));
    }
    if (flexibility.present) {
      map['flexibility'] = Variable<String>($ApplicationEntriesTable
          .$converterflexibilityn
          .toSql(flexibility.value));
    }
    if (salaryRange.present) {
      map['salary_range'] = Variable<String>($ApplicationEntriesTable
          .$convertersalaryRangen
          .toSql(salaryRange.value));
    }
    if (statusEvents.present) {
      map['status_events'] = Variable<String>($ApplicationEntriesTable
          .$converterstatusEventsn
          .toSql(statusEvents.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApplicationEntriesCompanion(')
          ..write('id: $id, ')
          ..write('company: $company, ')
          ..write('role: $role, ')
          ..write('location: $location, ')
          ..write('jobPostUrl: $jobPostUrl, ')
          ..write('companyUrl: $companyUrl, ')
          ..write('note: $note, ')
          ..write('applicationDate: $applicationDate, ')
          ..write('status: $status, ')
          ..write('type: $type, ')
          ..write('opportunity: $opportunity, ')
          ..write('flexibility: $flexibility, ')
          ..write('salaryRange: $salaryRange, ')
          ..write('statusEvents: $statusEvents')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ApplicationEntriesTable applicationEntries =
      $ApplicationEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [applicationEntries];
}

typedef $$ApplicationEntriesTableCreateCompanionBuilder
    = ApplicationEntriesCompanion Function({
  Value<int> id,
  required String company,
  required String role,
  Value<String?> location,
  Value<String?> jobPostUrl,
  Value<String?> companyUrl,
  Value<String?> note,
  Value<DateTime?> applicationDate,
  required ApplicationStatus status,
  Value<JobType?> type,
  Value<OpportunityType?> opportunity,
  Value<WorkFlexibility?> flexibility,
  Value<SalaryRange?> salaryRange,
  Value<Set<StatusEvent>?> statusEvents,
});
typedef $$ApplicationEntriesTableUpdateCompanionBuilder
    = ApplicationEntriesCompanion Function({
  Value<int> id,
  Value<String> company,
  Value<String> role,
  Value<String?> location,
  Value<String?> jobPostUrl,
  Value<String?> companyUrl,
  Value<String?> note,
  Value<DateTime?> applicationDate,
  Value<ApplicationStatus> status,
  Value<JobType?> type,
  Value<OpportunityType?> opportunity,
  Value<WorkFlexibility?> flexibility,
  Value<SalaryRange?> salaryRange,
  Value<Set<StatusEvent>?> statusEvents,
});

class $$ApplicationEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ApplicationEntriesTable> {
  $$ApplicationEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jobPostUrl => $composableBuilder(
      column: $table.jobPostUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyUrl => $composableBuilder(
      column: $table.companyUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get applicationDate => $composableBuilder(
      column: $table.applicationDate,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ApplicationStatus, ApplicationStatus, String>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<JobType?, JobType, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<OpportunityType?, OpportunityType, String>
      get opportunity => $composableBuilder(
          column: $table.opportunity,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<WorkFlexibility?, WorkFlexibility, String>
      get flexibility => $composableBuilder(
          column: $table.flexibility,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<SalaryRange?, SalaryRange, String>
      get salaryRange => $composableBuilder(
          column: $table.salaryRange,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Set<StatusEvent>?, Set<StatusEvent>, String>
      get statusEvents => $composableBuilder(
          column: $table.statusEvents,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ApplicationEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ApplicationEntriesTable> {
  $$ApplicationEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jobPostUrl => $composableBuilder(
      column: $table.jobPostUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyUrl => $composableBuilder(
      column: $table.companyUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get applicationDate => $composableBuilder(
      column: $table.applicationDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get opportunity => $composableBuilder(
      column: $table.opportunity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get flexibility => $composableBuilder(
      column: $table.flexibility, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get salaryRange => $composableBuilder(
      column: $table.salaryRange, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get statusEvents => $composableBuilder(
      column: $table.statusEvents,
      builder: (column) => ColumnOrderings(column));
}

class $$ApplicationEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ApplicationEntriesTable> {
  $$ApplicationEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get jobPostUrl => $composableBuilder(
      column: $table.jobPostUrl, builder: (column) => column);

  GeneratedColumn<String> get companyUrl => $composableBuilder(
      column: $table.companyUrl, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get applicationDate => $composableBuilder(
      column: $table.applicationDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ApplicationStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<JobType?, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OpportunityType?, String> get opportunity =>
      $composableBuilder(
          column: $table.opportunity, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WorkFlexibility?, String> get flexibility =>
      $composableBuilder(
          column: $table.flexibility, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SalaryRange?, String> get salaryRange =>
      $composableBuilder(
          column: $table.salaryRange, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Set<StatusEvent>?, String>
      get statusEvents => $composableBuilder(
          column: $table.statusEvents, builder: (column) => column);
}

class $$ApplicationEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ApplicationEntriesTable,
    ApplicationDetails,
    $$ApplicationEntriesTableFilterComposer,
    $$ApplicationEntriesTableOrderingComposer,
    $$ApplicationEntriesTableAnnotationComposer,
    $$ApplicationEntriesTableCreateCompanionBuilder,
    $$ApplicationEntriesTableUpdateCompanionBuilder,
    (
      ApplicationDetails,
      BaseReferences<_$AppDatabase, $ApplicationEntriesTable,
          ApplicationDetails>
    ),
    ApplicationDetails,
    PrefetchHooks Function()> {
  $$ApplicationEntriesTableTableManager(
      _$AppDatabase db, $ApplicationEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ApplicationEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ApplicationEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ApplicationEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> company = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> jobPostUrl = const Value.absent(),
            Value<String?> companyUrl = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime?> applicationDate = const Value.absent(),
            Value<ApplicationStatus> status = const Value.absent(),
            Value<JobType?> type = const Value.absent(),
            Value<OpportunityType?> opportunity = const Value.absent(),
            Value<WorkFlexibility?> flexibility = const Value.absent(),
            Value<SalaryRange?> salaryRange = const Value.absent(),
            Value<Set<StatusEvent>?> statusEvents = const Value.absent(),
          }) =>
              ApplicationEntriesCompanion(
            id: id,
            company: company,
            role: role,
            location: location,
            jobPostUrl: jobPostUrl,
            companyUrl: companyUrl,
            note: note,
            applicationDate: applicationDate,
            status: status,
            type: type,
            opportunity: opportunity,
            flexibility: flexibility,
            salaryRange: salaryRange,
            statusEvents: statusEvents,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String company,
            required String role,
            Value<String?> location = const Value.absent(),
            Value<String?> jobPostUrl = const Value.absent(),
            Value<String?> companyUrl = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime?> applicationDate = const Value.absent(),
            required ApplicationStatus status,
            Value<JobType?> type = const Value.absent(),
            Value<OpportunityType?> opportunity = const Value.absent(),
            Value<WorkFlexibility?> flexibility = const Value.absent(),
            Value<SalaryRange?> salaryRange = const Value.absent(),
            Value<Set<StatusEvent>?> statusEvents = const Value.absent(),
          }) =>
              ApplicationEntriesCompanion.insert(
            id: id,
            company: company,
            role: role,
            location: location,
            jobPostUrl: jobPostUrl,
            companyUrl: companyUrl,
            note: note,
            applicationDate: applicationDate,
            status: status,
            type: type,
            opportunity: opportunity,
            flexibility: flexibility,
            salaryRange: salaryRange,
            statusEvents: statusEvents,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ApplicationEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ApplicationEntriesTable,
    ApplicationDetails,
    $$ApplicationEntriesTableFilterComposer,
    $$ApplicationEntriesTableOrderingComposer,
    $$ApplicationEntriesTableAnnotationComposer,
    $$ApplicationEntriesTableCreateCompanionBuilder,
    $$ApplicationEntriesTableUpdateCompanionBuilder,
    (
      ApplicationDetails,
      BaseReferences<_$AppDatabase, $ApplicationEntriesTable,
          ApplicationDetails>
    ),
    ApplicationDetails,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ApplicationEntriesTableTableManager get applicationEntries =>
      $$ApplicationEntriesTableTableManager(_db, _db.applicationEntries);
}
