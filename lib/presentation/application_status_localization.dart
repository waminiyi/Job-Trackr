import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:job_trackr/database/table.dart';

extension ApplicationStatusLocalization on ApplicationStatus {
  String localized(BuildContext context) {
    switch (this) {
      case ApplicationStatus.applied:
        return AppLocalizations.of(context)!.applicationStatus_applied;
      case ApplicationStatus.reviewed:
        return AppLocalizations.of(context)!.applicationStatus_reviewed;
      case ApplicationStatus.hrInterviewing:
        return AppLocalizations.of(context)!.applicationStatus_hrInterviewing;
      case ApplicationStatus.technicalInterviewing:
        return AppLocalizations.of(context)!.applicationStatus_technicalInterviewing;
      case ApplicationStatus.technicalTest:
        return AppLocalizations.of(context)!.applicationStatus_technicalTest;
      case ApplicationStatus.accepted:
        return AppLocalizations.of(context)!.applicationStatus_accepted;
      case ApplicationStatus.ghosting:
        return AppLocalizations.of(context)!.applicationStatus_ghosting;
      case ApplicationStatus.rejected:
        return AppLocalizations.of(context)!.applicationStatus_rejected;
      case ApplicationStatus.waitingForInterviewFeedback:
      case ApplicationStatus.offer:
      return AppLocalizations.of(context)!.applicationStatus_offer;

    }
  }
}
