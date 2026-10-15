import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rovers_dashboard/core/di/get_it.dart';
import 'package:rovers_dashboard/core/services/data_service.dart';
import 'package:rovers_dashboard/core/utils/app_consts.dart';
import 'package:rovers_dashboard/models/user_model.dart';

final dataServiceProvider = Provider<DataService>(
  (ref) => getIt<DataService>(),
);

final userPovider = FutureProvider<List<UserModel>>((ref) async {
  final service = ref.watch(dataServiceProvider);
  final result = await service.getData(endPoint: AppConsts.usersEndPoint);
  return result.fold((failure) {
    throw failure;
  }, (users) => users);
});
