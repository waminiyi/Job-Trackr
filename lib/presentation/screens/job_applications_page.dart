import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_trackr/presentation/screens/job_application_cart.dart';
import 'package:job_trackr/presentation/screens/state.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'add_edit_application/add_edit_application.dart';

class JobApplicationsPage extends ConsumerStatefulWidget {
  const JobApplicationsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JobApplicationsPageState createState() => _JobApplicationsPageState();
}

class _JobApplicationsPageState extends ConsumerState<JobApplicationsPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final jobApplications = ref.watch(applications);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.jobApplications),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: jobApplications.when(
              data: (entries) {
                for (var application in entries) {
                  debugPrint('Job Application: ID: ${application.id}, Role: ${application.role}, Company: ${application.company}, '
                      'Date: ${application.applicationDate?.toIso8601String() ?? 'Not specified'}, '
                      'Status: ${application.status}, Location: ${application.location ?? 'Not specified'}, '
                      'Flexibility: ${application.flexibility?.name ?? 'Not specified'}');
                }

                return ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return JobApplicationCard(application: entries[index]);
                  },
                );
              },
              error: (e, s) {
                debugPrintStack(label: e.toString(), stackTrace: s);
                return const Text('An error has occured');
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push<void>(MaterialPageRoute(builder: (context) {
            return const JobApplicationForm(null);
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
