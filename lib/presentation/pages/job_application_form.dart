import 'package:flutter/material.dart';
import '../../data/models/application_status.dart';
import '../../data/models/application_type.dart';
import '../../data/models/job_application_details.dart';
import '../../main.dart';

class JobApplicationForm extends StatefulWidget {
  const JobApplicationForm({super.key});

  @override
  JobApplicationFormState createState() => JobApplicationFormState();
}

class JobApplicationFormState extends State<JobApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String _title = '';
  String _enterpriseName = '';
  DateTime _applicationDate = DateTime.now();
  ApplicationType _applicationType = ApplicationType.jobPost;
  ApplicationStatus _status = ApplicationStatus.planned;
  Map<ApplicationStatus, DateTime> _statusDates = {};
  String? _jobBoardName;
  String? _jobPostLink;
  String? _enterpriseLink;
  String? _locationName;
  String? _note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job Application'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Job Title Input Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Job Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the job title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),

                // Enterprise Name Input Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enterprise Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the enterprise name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enterpriseName = value!;
                  },
                ),

                // Application Date Input Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Application Date'),
                  keyboardType: TextInputType.datetime,
                  initialValue: _applicationDate.toIso8601String().split('T').first,
                  onSaved: (value) {
                    _applicationDate = DateTime.parse(value!);
                  },
                ),

                // Application Type Dropdown
                DropdownButtonFormField<ApplicationType>(
                  decoration: InputDecoration(labelText: 'Application Type'),
                  value: _applicationType,
                  items: ApplicationType.values
                      .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _applicationType = value!;
                    });
                  },
                ),

                // Status Dropdown
                DropdownButtonFormField<ApplicationStatus>(
                  decoration: InputDecoration(labelText: 'Application Status'),
                  value: _status,
                  items: ApplicationStatus.values
                      .map((status) => DropdownMenuItem(
                    value: status,
                    child: Text(status.toString().split('.').last),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _status = value!;
                      _statusDates[_status] = DateTime.now(); // Automatically set status date
                    });
                  },
                ),

                // Job Board Name (Optional)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Job Board Name (Optional)'),
                  onSaved: (value) {
                    _jobBoardName = value;
                  },
                ),

                // Job Post Link (Optional)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Job Post Link (Optional)'),
                  onSaved: (value) {
                    _jobPostLink = value;
                  },
                ),

                // Enterprise Link (Optional)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enterprise Link (Optional)'),
                  onSaved: (value) {
                    _enterpriseLink = value;
                  },
                ),

                // Location Name (Optional)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Location Name (Optional)'),
                  onSaved: (value) {
                    _locationName = value;
                  },
                ),

                // Note (Optional)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Note (Optional)'),
                  onSaved: (value) {
                    _note = value;
                  },
                ),

                SizedBox(height: 20),

                // Submit Button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Create a JobApplication object and insert it into the database
                      JobApplicationDetails jobApplication = JobApplicationDetails(
                        title: _title,
                        enterpriseName: _enterpriseName,
                        applicationDate: _applicationDate,
                        applicationType: _applicationType,
                        status: _status,
                        statusDates: _statusDates,
                        jobBoardName: _jobBoardName,
                        jobPostLink: _jobPostLink,
                        enterpriseLink: _enterpriseLink,
                        locationName: _locationName,
                        note: _note,
                      );

                      await jobApplicationProvider.saveJobApplication(jobApplication);

                      // Show success message and navigate back
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Job Application Added')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}