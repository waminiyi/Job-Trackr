import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/models/job_type.dart';


extension JobTypeExtension on JobType {
  String localizedString(BuildContext context) {
    switch (this) {
      case JobType.fullTime:
        return AppLocalizations.of(context)!.fullTime;
      case JobType.partTime:
        return AppLocalizations.of(context)!.partTime;
      case JobType.internship:
        return AppLocalizations.of(context)!.internship;
      case JobType.contract:
        return AppLocalizations.of(context)!.contract;
      case JobType.apprenticeship:
        return AppLocalizations.of(context)!.apprenticeship;
      case JobType.temporary:
        return AppLocalizations.of(context)!.temporary;
      case JobType.freelance:
        return AppLocalizations.of(context)!.freelance;
      case JobType.other:
        return AppLocalizations.of(context)!.other;
    }
  }
}
