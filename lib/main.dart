import 'package:flutter/material.dart';
import 'package:job_trackr/presentation/pages/job_applications_page.dart';
import 'package:sqflite/sqflite_dev.dart';
import 'data/providers/job_application_provider.dart';

late JobApplicationProvider jobApplicationProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbFactory = sqfliteDatabaseFactoryDefault;

  jobApplicationProvider = JobApplicationProvider(dbFactory);
  await jobApplicationProvider.init();

  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: JobApplicationsPage(),
  ));
}
