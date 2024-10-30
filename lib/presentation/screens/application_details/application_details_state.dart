
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/job_application_details.dart';
import '../../../database/database.dart';

final applicationDetailsProvider = StreamProvider.family<ApplicationDetails, int>((ref, applicationId) {
  final database = ref.watch(AppDatabase.provider);
  return database.applicationDetails(applicationId);
});