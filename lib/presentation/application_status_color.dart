import 'package:flutter/material.dart';

import '../data/models/application_status.dart';

extension ApplicationStatusDecoration on ApplicationStatus {
  BoxDecoration get decoration {
    Color color;
    switch (this) {
      case ApplicationStatus.applied:
        color = Colors.blue; // Color for 'applied'
        break;
      case ApplicationStatus.reviewed:
        color = Colors.yellow; // Color for 'reviewed'
        break;
      case ApplicationStatus.hrInterviewing:
        color = Colors.orange; // Color for 'HR Interviewing'
        break;
      case ApplicationStatus.technicalInterviewing:
        color = Colors.lightGreen; // Color for 'Technical Interviewing'
        break;
      case ApplicationStatus.waitingForInterviewFeedback:
        color = Colors.grey; // Color for 'Waiting for Feedback'
        break;
      case ApplicationStatus.technicalTest:
        color = Colors.teal; // Color for 'Technical Test'
        break;
      case ApplicationStatus.accepted:
        color = Colors.green; // Color for 'Accepted'
        break;
      case ApplicationStatus.ghosting:
        color = Colors.black; // Color for 'Ghosting'
        break;
      case ApplicationStatus.rejected:
        color = Colors.red; // Color for 'Rejected'
        break;
      case ApplicationStatus.offer:
        color = Colors.purple; // Color for 'Offer'
        break;
      case ApplicationStatus.planned:
      default:
        color = Colors
            .pink; // Default color for 'Planned' and any other unknown status
        break;
    }

    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );
  }
}
