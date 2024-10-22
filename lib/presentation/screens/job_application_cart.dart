import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_trackr/presentation/application_status_color.dart';
import 'package:job_trackr/presentation/application_status_localization.dart';
import 'package:job_trackr/presentation/work_flexibility_localization.dart';

import '../../data/models/application_status.dart';
import '../../data/models/job_application.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobApplicationCard extends StatelessWidget {
  final JobApplication application;

  JobApplicationCard({required this.application})
      : super(key: ObjectKey(application.id));

  @override
  Widget build(BuildContext context) {
    final DateFormat localizedDateFormat =
        DateFormat.yMMMMd(Localizations.localeOf(context).toString());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          side: BorderSide(
            color: Colors.grey.shade300, // Border color
            width: 1.0, // Border width
          ),
        ),
        color: Colors.transparent,
        // Removes background color
        elevation: 0,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.apartment),
                      const SizedBox(width: 8),
                      Text(
                        application.company,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // This makes the row take the minimum width
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: application.status
                              .decoration,
                        ),
                        const SizedBox(width: 8),
                        // Space between the circle and text
                        Text(
                          application.status.localized(context),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black, // Adjust color based on theme
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Status badge and Job title row
              const SizedBox(height: 10),

              Text(
                application.role,
                style: TextStyle(fontSize: 16),
              ),

              // Company name

              const SizedBox(height: 8),
              Text(
                '${application.location ?? AppLocalizations.of(context)!.locationNotSpecified}'
                '${application.flexibility != null ? ' (${application.flexibility!.localizedString(context)})' : ''}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),

              Text(
                application.applicationDate != null
                    ? AppLocalizations.of(context)!.appliedOn(
                        localizedDateFormat
                            .format(application.applicationDate!))
                    : application.status == ApplicationStatus.planned
                        ? AppLocalizations.of(context)!.applicationPlanned
                        : 'Unknown application date',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
