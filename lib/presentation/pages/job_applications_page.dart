import 'package:flutter/material.dart';
import 'package:job_trackr/data/providers/job_application_provider.dart';
import 'package:job_trackr/main.dart';
import 'package:job_trackr/presentation/pages/job_application_form.dart';

import '../../data/models/job_application.dart';

class JobApplicationsPage extends StatefulWidget {
  const JobApplicationsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JobApplicationsPageState createState() => _JobApplicationsPageState();
}

class _JobApplicationsPageState extends State<JobApplicationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Job Applications',
      )),
      body: StreamBuilder<List<JobApplication?>>(
        stream: jobApplicationProvider.onJobApplications(),
        builder: (context, snapshot) {
          var jobApplications = snapshot.data;
          if (jobApplications == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: jobApplications.length,
              itemBuilder: (context, index) {
                var jobApplication = jobApplications[index]!;
                return ListTile(
                  title: Text(jobApplication.title),
                  subtitle: Column(
                    children: [
                      Text(jobApplication.enterpriseName),
                      Text(jobApplication.applicationDate.toIso8601String())
                    ],
                  ),
                  onTap: () {},
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push<void>(MaterialPageRoute(builder: (context) {
            return const JobApplicationForm();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
