import 'package:drift/drift.dart' as Drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:job_trackr/presentation/application_status_localization.dart';
import '../../database/database.dart';
import '../../database/table.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobApplicationForm extends ConsumerStatefulWidget {
  const JobApplicationForm({super.key});

  @override
  JobApplicationFormState createState() => JobApplicationFormState();
}

class JobApplicationFormState extends ConsumerState<JobApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String _role = '';
  String _company = '';
  DateTime _applicationDate = DateTime.now();
  OpportunityType _applicationType = OpportunityType.jobPost;
  ApplicationStatus _status = ApplicationStatus.applied;
  String? _location;
  String? _note;

  // Method to trigger date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _applicationDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _applicationDate) {
      setState(() {
        _applicationDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleAddJob),
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
                    _role = value!;
                  },
                ),

                // Enterprise Name Input Field
                TextFormField(
                  decoration: InputDecoration(labelText: 'Company Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the enterprise name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _company = value!;
                  },
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Application Date (Optional)'),
                        readOnly: true,
                        controller: TextEditingController(
                          text: _applicationDate != null
                              ? DateFormat.yMMMd().format(_applicationDate!)
                              : 'No date chosen',
                        ),
                        onTap: () => _pickDate(context),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _pickDate(context),
                    ),
                  ],
                ),

                // Application Type Dropdown
                DropdownButtonFormField<OpportunityType>(
                  decoration: InputDecoration(labelText: 'Application Type'),
                  value: _applicationType,
                  items: OpportunityType.values
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
                            child: Text(status.localized(context)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _status = value!;
                    });
                  },
                ),

                // Location Name (Optional)
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Location Name (Optional)'),
                  onSaved: (value) {
                    _location = value;
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

                      ref
                          .read(AppDatabase.provider)
                          .applicationEntries
                          .insertOne(ApplicationEntriesCompanion.insert(
                            role: _role,
                            company: _company,
                            applicationDate: Drift.Value(_applicationDate),
                            opportunity: Drift.Value(_applicationType),
                            status: _status,
                            location: Drift.Value(_location),
                            note: Drift.Value(_note),
                          ));

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
