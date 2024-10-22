import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:job_trackr/data/models/job_application_details.dart';
import 'package:job_trackr/data/models/work_flexibility.dart';
import 'package:job_trackr/presentation/application_status_localization.dart';
import 'package:job_trackr/presentation/opportunity_type_localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:job_trackr/presentation/work_flexibility_localization.dart';

import '../../../data/models/application_status.dart';
import '../../../data/models/opportunity_type.dart';
import '../../../data/validator.dart';
import '../../../database/database.dart';

class JobApplicationForm extends ConsumerStatefulWidget {
  final ApplicationDetails? initialApplication;

  const JobApplicationForm(this.initialApplication, {super.key});

  @override
  JobApplicationFormState createState() => JobApplicationFormState();
}

class JobApplicationFormState extends ConsumerState<JobApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  String _role = '';
  String _company = '';
  DateTime? _applicationDate;
  OpportunityType? _opportunityType;
  WorkFlexibility? _flexibility;
  ApplicationStatus? _status;
  String? _location;
  String? _note;
  String? _jobPostUrl;

  @override
  void initState() {
    _role = widget.initialApplication?.role ?? '';
    _company = widget.initialApplication?.company ?? '';
    _applicationDate = widget.initialApplication?.applicationDate;
    _opportunityType = widget.initialApplication?.opportunity;
    _status = widget.initialApplication?.status;
    _location = widget.initialApplication?.location;
    _note = widget.initialApplication?.note;
    _jobPostUrl = widget.initialApplication?.jobPostUrl;
    _flexibility = widget.initialApplication?.flexibility;
    super.initState();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _applicationDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _applicationDate = picked;
      });
    }
  }

  Future<void> _saveJobApplication() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref.read(AppDatabase.provider).applicationEntries.insertOne(
            ApplicationEntriesCompanion.insert(
              role: _role,
              company: _company,
              applicationDate: _applicationDate != null
                  ? drift.Value(_applicationDate)
                  : const drift.Value.absent(),
              opportunity: drift.Value(_opportunityType),
              status: _status!,
              location: (_location != null && _location!.isNotEmpty)
                  ? drift.Value(_location!)
                  : const drift.Value.absent(),
              jobPostUrl: (_jobPostUrl != null && _jobPostUrl!.isNotEmpty)
                  ? drift.Value(_jobPostUrl!)
                  : const drift.Value.absent(),
              flexibility: drift.Value(_flexibility),
              note: (_note != null && _note!.isNotEmpty)
                  ? drift.Value(_note!)
                  : const drift.Value.absent(),
            ),
          );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.applicationSaved)),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat localizedDateFormat =
        DateFormat.yMMMMd(Localizations.localeOf(context).toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialApplication != null
            ? AppLocalizations.of(context)!.titleEditJob
            : AppLocalizations.of(context)!.titleAddJob),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '${AppLocalizations.of(context)!.company}*'),
                  validator: (value) => validateNotEmpty(
                      value, AppLocalizations.of(context)!.missingCompanyName),
                  onSaved: (value) {
                    _company = value!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '${AppLocalizations.of(context)!.role}*'),
                  validator: (value) => validateNotEmpty(
                      value, AppLocalizations.of(context)!.missingRole),
                  onSaved: (value) {
                    _role = value!;
                  },
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<ApplicationStatus>(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText:
                          '${AppLocalizations.of(context)!.applicationStatus}*'),
                  value: _status,
                  items: ApplicationStatus.values
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status.localized(context)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _status = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return AppLocalizations.of(context)!.missingStatus;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.applicationDate),
                  readOnly: true,
                  controller: TextEditingController(
                    text: _applicationDate != null
                        ? localizedDateFormat.format(_applicationDate!)
                        : '',
                  ),
                  onTap: () => _pickDate(context),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.jobPostUrl),
                  // New field for jobPostUrl
                  onSaved: (value) {
                    _jobPostUrl = value;
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.location),
                  onSaved: (value) {
                    _location = value;
                  },
                ),
                const SizedBox(height: 20),

                DropdownButtonFormField<WorkFlexibility>(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.flexibility),
                  value: _flexibility,
                  items: WorkFlexibility.values
                      .map((flexibility) => DropdownMenuItem(
                            value: flexibility,
                            child: Text(flexibility.localizedString(context)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _flexibility = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),

                DropdownButtonFormField<OpportunityType>(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.opportunity),
                  value: _opportunityType,
                  items: OpportunityType.values
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.localizedString(context)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _opportunityType = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.note),
                  onSaved: (value) {
                    _note = value;
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _saveJobApplication();
                      },
                      child: Text(AppLocalizations.of(context)!.save),
                    ),
                  ],
                )
                // Submit Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
