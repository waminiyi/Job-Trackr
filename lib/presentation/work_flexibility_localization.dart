
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/models/work_flexibility.dart';
import '../database/table.dart';
extension WorkFlexibilityExtension on WorkFlexibility {
  String localizedString(BuildContext context) {
    switch (this) {
      case WorkFlexibility.fullRemote:
        return AppLocalizations.of(context)!.fullRemote;
      case WorkFlexibility.onSite:
        return AppLocalizations.of(context)!.onSite;
      case WorkFlexibility.hybrid:
        return AppLocalizations.of(context)!.hybrid;
      case WorkFlexibility.negotiable:
        return AppLocalizations.of(context)!.negotiable;
    }
  }
}
