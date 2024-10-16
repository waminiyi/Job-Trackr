import 'package:flutter/material.dart';
import 'package:job_trackr/data/models/job_application.dart';
import 'package:job_trackr/main.dart';
import 'package:job_trackr/presentation/pages/job_application_form.dart';
import 'package:job_trackr/presentation/pages/job_application_cart.dart';

import '../../data/models/job_application_details.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<List<JobApplication?>>(
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
                  return JobApplicationCard(application: jobApplication);
                });
          },
        ),
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
