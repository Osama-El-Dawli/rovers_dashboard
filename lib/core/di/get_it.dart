import 'package:get_it/get_it.dart';
import 'package:rovers_dashboard/core/services/data_service.dart';
import 'package:rovers_dashboard/core/services/supabase_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<DataService>(() => SupabaseService());
}
