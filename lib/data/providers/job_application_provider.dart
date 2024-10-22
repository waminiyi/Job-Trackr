/*
import 'dart:async';
import 'dart:collection';

import 'package:job_trackr/data/models/application_status.dart';
import 'package:job_trackr/data/models/opportunity_type.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import '../models/constants.dart';
import '../models/job_application.dart';
import '../models/job_application_details.dart';

JobApplicationDetails snapshotToJobApplicationDetails(
    Map<String, Object?> snapshot) {
  return JobApplicationDetails.fromMap(snapshot);
}

JobApplication snapshotToJobApplication(Map<String, Object?> snapshot) {
  return JobApplication.fromMap(snapshot);
}

class JobApplications extends ListBase<JobApplication> {
  final List<Map<String, Object?>> list;
  late List<JobApplication?> _cacheJobApplications;

  JobApplications(this.list) {
    _cacheJobApplications = List.generate(list.length, (index) => null);
  }

  @override
  JobApplication operator [](int index) {
    return _cacheJobApplications[index] ??=
        snapshotToJobApplication(list[index]);
  }

  @override
  int get length => list.length;

  @override
  void operator []=(int index, JobApplication? value) => throw 'read-only';

  @override
  set length(int newLength) => throw 'read-only';
}

class JobApplicationProvider {
  final DatabaseFactory dbFactory;
  final _updateTriggerController = StreamController<bool>.broadcast();
  final version = 1;
  final lock = Lock(reentrant: true);

  Database? db;

  JobApplicationProvider(this.dbFactory);

  Future<void> init() async {
    await ready;
  }

  //TODO : migration strategy

  Future openPath(String path) async {
    db = await dbFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: version,
            onCreate: (db, version) async {
              await _createDb(db);
            },
            onUpgrade: (db, oldVersion, newVersion) async {
              if (oldVersion < version) {
                await _createDb(db);
              }
            }));
  }

  void _triggerUpdate() {
    _updateTriggerController.sink.add(true);
  }

  Future<Database?> get ready async => db ??= await lock.synchronized(() async {
        if (db == null) {
          await open();
        }
        return db;
      });

  Future<JobApplicationDetails?> getJobApplication(int? id) async {
    var list = (await db!.query(
      tableJobApplications,
      columns: [
        columnId,
        columnTitle,
        columnEnterpriseName,
        columnApplicationDate,
        columnApplicationType,
        columnStatus,
        columnStatusDates,
        columnJobBoardName,
        columnJobPostLink,
        columnEnterpriseLink,
        columnLocationName,
        columnNote
      ],
      where: '$columnId = ?',
      whereArgs: <Object?>[id],
    ));

    if (list.isNotEmpty) {
      return JobApplicationDetails.fromMap(list.first);
    }
    return null;
  }

  Future _createDb(Database db) async {
    await db.execute('DROP TABLE If EXISTS $tableJobApplications');
    await db.execute('''
   CREATE TABLE $tableJobApplications(
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnTitle TEXT NOT NULL,
    $columnEnterpriseName TEXT NOT NULL,
    $columnApplicationDate INTEGER NOT NULL,   
    $columnApplicationType INTEGER NOT NULL,  
    $columnStatus INTEGER NOT NULL,  
    $columnStatusDates TEXT,  
    $columnJobBoardName TEXT,  
    $columnJobPostLink TEXT,  
    $columnEnterpriseLink TEXT,
    $columnLocationName TEXT,
    $columnNote TEXT)
     ''');

    await db.execute(
        'CREATE INDEX Enterprise ON $tableJobApplications ($columnEnterpriseName)');

    await _saveJobApplication(
        db,
        JobApplicationDetails(
          title: 'Android developer',
          enterpriseName: 'Diabeloop',
          applicationDate: DateTime.now(),
          applicationType: ApplicationType.jobPost,
          status: ApplicationStatus.sent,
          statusDates: {},
        ));
    await _saveJobApplication(
        db,
        JobApplicationDetails(
          title: 'Mobile software developer',
          enterpriseName: 'Viseo',
          applicationDate: DateTime.now(),
          applicationType: ApplicationType.jobPost,
          status: ApplicationStatus.sent,
          statusDates: {},
        ));
    _triggerUpdate();
  }

  Future open() async {
    await openPath(await fixPath(databaseName));
  }

  Future<String> fixPath(String path) async => path;

  Future _saveJobApplication(
      DatabaseExecutor? db, JobApplicationDetails updatedApplication) async {
    if (updatedApplication.id != null) {
      await db!.update(tableJobApplications, updatedApplication.toMap(),
          where: '$columnId = ?', whereArgs: <Object?>[updatedApplication.id]);
    } else {
      updatedApplication.id =
          await db!.insert(tableJobApplications, updatedApplication.toMap());
    }
  }

  Future saveJobApplication(JobApplicationDetails updatedApplication) async {
    await _saveJobApplication(db, updatedApplication);
    _triggerUpdate();
  }

  Future<void> deleteApplication(int? id) async {
    await db!.delete(tableJobApplications,
        where: '$columnId = ?', whereArgs: <Object?>[id]);
    _triggerUpdate();
  }

  var jobApplicationsTransformer = StreamTransformer<List<Map<String, Object?>>,
      List<JobApplication>>.fromHandlers(handleData: (snapshotList, sink) {
    sink.add(JobApplications(snapshotList));
  });

  var jobApplicationTransformer = StreamTransformer<Map<String, Object?>,
      JobApplicationDetails?>.fromHandlers(handleData: (snapshot, sink) {
    sink.add(snapshotToJobApplicationDetails(snapshot));
  });

  /// Listen for changes on any JobApplication
  Stream<List<JobApplication?>> onJobApplications() {
    late StreamController<JobApplications> controller;
    StreamSubscription? triggerSubscription;

    Future<void> sendUpdate() async {
      var jobApplications = await getJobApplications();
      if (!controller.isClosed) {
        controller.add(jobApplications);
      }
    }

    controller = StreamController<JobApplications>(onListen: () {
      sendUpdate();

      /// Listen for trigger
      triggerSubscription = _updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      triggerSubscription?.cancel();
    });
    return controller.stream;
  }

  /// Listen for changes on a given JobApplication
  Stream<JobApplicationDetails?> onJobApplication(int? id) {
    late StreamController<JobApplicationDetails?> controller;
    StreamSubscription? triggerSubscription;

    Future<void> sendUpdate() async {
      var note = await getJobApplication(id);
      if (!controller.isClosed) {
        controller.add(note);
      }
    }

    controller = StreamController<JobApplicationDetails?>(onListen: () {
      sendUpdate();

      /// Listen for trigger
      triggerSubscription = _updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      triggerSubscription?.cancel();
    });
    return controller.stream;
  }

  /// Don't read all fields
  Future<JobApplications> getJobApplications(
      {int? offset, int? limit, bool? descending}) async {
    var list = (await db!.query(tableJobApplications,
        columns: [
          columnId,
          columnTitle,
          columnEnterpriseName,
          columnApplicationDate,
          columnStatus,
          columnLocationName
        ],
        orderBy:
            '$columnEnterpriseName ${(descending ?? false) ? 'ASC' : 'DESC'}',
        limit: limit,
        offset: offset));
    return JobApplications(list);
  }

  Future clearAllNotes() async {
    await db!.delete(tableJobApplications);
    _triggerUpdate();
  }

  Future close() async {
    await db!.close();
  }

  Future deleteDb() async {
    await dbFactory.deleteDatabase(await fixPath(databaseName));
  }
}
*/
