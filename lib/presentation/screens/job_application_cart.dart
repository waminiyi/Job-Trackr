import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_trackr/presentation/application_status_localization.dart';

import '../../data/models/application_status.dart';
import '../../data/models/job_application.dart';

final DateFormat _format = DateFormat.yMMMd();

class JobApplicationCard extends StatelessWidget {
  final JobApplication application;

  JobApplicationCard({required this.application})
      : super(key: ObjectKey(application.id));

  @override
  Widget build(BuildContext context) {
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
                      Icon(Icons.apartment),
                      const SizedBox(width: 8),
                      Text(
                        application.enterpriseName,
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
                          width: 12.0,
                          height: 12.0,
                          decoration: BoxDecoration(
                            color: application.status == ApplicationStatus.applied
                                ? Colors.blue
                                : Colors.purple,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Space between the circle and text
                        Text(
                          application.status.localized(context),
                          style: const TextStyle(
                            fontSize: 16,
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
                application.title,
                style: TextStyle(fontSize: 16),
              ),

              // Company name

              const SizedBox(height: 8),
              Text('Greater Grenoble (hybrid)'),
              const SizedBox(height: 8),

              Text('Applied on ${_format.format(application.applicationDate)}'),
            ],
          ),
        ),
      ),
    );
  }
}
