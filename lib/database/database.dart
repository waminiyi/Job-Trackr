import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:job_trackr/data/models/job_application.dart';
import 'package:job_trackr/database/table.dart';
import 'package:riverpod/riverpod.dart';

import '../data/models/application_type.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ApplicationEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: "job_trackr_db"));

  @override
  int get schemaVersion => 1;

  //TODO : handle migration strategy

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      await m.createAll();
    }, beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');

      await batch((b) {
        b.insert(
          applicationEntries,
          ApplicationEntriesCompanion.insert(
            role: 'Android developer',
            company: 'Diabeloop',
            applicationDate: Value(DateTime.now()),
            opportunity: const Value(OpportunityType.jobPost),
            status: ApplicationStatus.applied,
          ),
        );
        b.insert(
          applicationEntries,
          ApplicationEntriesCompanion.insert(
            role: 'Mobile software developer',
            company: 'Viseo',
            applicationDate:
                Value(DateTime.now().subtract(const Duration(days: 7))),
            opportunity: const Value(OpportunityType.jobPost),
            status: ApplicationStatus.applied,
          ),
        );

        b.insert(
          applicationEntries,
          ApplicationEntriesCompanion.insert(
            role: 'Mobile software developer',
            company: 'Thalès',
            applicationDate:
                Value(DateTime.now().subtract(const Duration(days: 4))),
            opportunity: const Value(OpportunityType.jobPost),
            status: ApplicationStatus.applied,
          ),
        );

        b.insert(
          applicationEntries,
          ApplicationEntriesCompanion.insert(
            role: 'Mobile software developer',
            company: 'Abylsen',
            applicationDate:
                Value(DateTime.now().subtract(const Duration(days: 20))),
            opportunity: const Value(OpportunityType.jobPost),
            status: ApplicationStatus.applied,
          ),
        );
      });
//TODO: implement schema verification
    });
  }

  Stream<List<JobApplication>> applications() {
    return (select(applicationEntries)
        .map((entry) => JobApplication(
            id: entry.id,
            title: entry.role,
            enterpriseName: entry.company,
            applicationDate: entry.applicationDate ?? DateTime.now(),
            status: entry.status,
            location: entry.location ?? ''))
        .watch());
  }

  static final StateProvider<AppDatabase> provider = StateProvider((ref) {
    final database = AppDatabase();
    ref.onDispose(database.close);

    return database;
  });
}
