
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/database.dart';

final applications = StreamProvider((ref) {
  final database = ref.watch(AppDatabase.provider);

  return database.applications();
});