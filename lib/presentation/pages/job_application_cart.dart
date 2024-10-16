import 'package:flutter/material.dart';
import 'package:job_trackr/data/models/application_status.dart';

import '../../data/models/job_application.dart';

class JobApplicationCard extends StatelessWidget {
  final JobApplication application;

  JobApplicationCard({required this.application})
      : super(key: ObjectKey(application.id));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  6.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          side: BorderSide(
            color: Colors.grey.shade300, // Border color
            width: 1.0, // Border width
          ),
        ),
        color: Colors.transparent, // Removes background color
        elevation: 0,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
                        color: application.status == ApplicationStatus.sent
                            ? Colors.blue
                            : Colors.purple,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8), // Space between the circle and text
                    Text(
                      application.status.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Adjust color based on theme
                      ),
                    ),
                  ],
                ),
              ),
              // Status badge and Job title row
              SizedBox(height: 10),

              Text(
                application.enterpriseName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              Text(
                application.title,
                style: TextStyle(fontSize: 16),
              ),

              // Company name

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Button to view details
                  TextButton(
                    onPressed: () {},
                    child: Text('Voir le détail'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  Text(application.applicationDate.toIso8601String())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
