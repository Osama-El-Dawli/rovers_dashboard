import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:rovers_dashboard/core/di/get_it.dart';
import 'package:rovers_dashboard/core/services/data_service.dart';
import 'package:rovers_dashboard/core/utils/app_consts.dart';
import 'package:rovers_dashboard/models/user_model.dart';

final dataServiceProvider = Provider<DataService>(
  (ref) => getIt<DataService>(),
);

final selectedFilterProvider = StateProvider<String>((ref) => 'الكل');

Map<String, dynamic>? _buildFilters(String filter) => switch (filter) {
  'ذكر' => {'sex': 'male'},
  'انثى' => {'sex': 'female'},
  'جديد' => {'isSaved': false},
  'تم تسجيله' => {'isSaved': true},
  'الكل' => null,
  _ => null,
};

final userPovider = FutureProvider.family<List<UserModel>, String>((
  ref,
  filter,
) async {
  final service = ref.watch(dataServiceProvider);
  final result = await service.getData(
    endPoint: AppConsts.usersEndPoint,
    filters: _buildFilters(filter),
  );
  return result.fold((failure) => throw failure, (users) => users);
});
