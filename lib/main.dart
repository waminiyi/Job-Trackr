import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_trackr/presentation/screens/job_applications_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(JobTrackr());
}

class JobTrackr extends StatelessWidget {
  JobTrackr({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Job Trackr',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
        ],
        theme: ThemeData(
          primarySwatch: Colors.amber,
          typography: Typography.material2018(),
        ),
        home: JobApplicationsPage(),
      ),
    );
  }
}
