
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/models/opportunity_type.dart';
extension OpportunityTypeExtension on OpportunityType {
  String localizedString(BuildContext context) {
    switch (this) {
      case OpportunityType.jobPost:
        return AppLocalizations.of(context)!.jobPost;
      case OpportunityType.referral:
        return AppLocalizations.of(context)!.referral;
      case OpportunityType.headhunted:
        return AppLocalizations.of(context)!.headhunted;
      case OpportunityType.networking:
        return AppLocalizations.of(context)!.networking;
      case OpportunityType.internalTransfer:
        return AppLocalizations.of(context)!.internalTransfer;
      case OpportunityType.walkIn:
        return AppLocalizations.of(context)!.walkIn;
      case OpportunityType.other:
        return AppLocalizations.of(context)!.otherOpportunity;
    }
  }
}
