import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rovers_dashboard/core/utils/app_consts.dart';
import 'package:rovers_dashboard/providers/users_provider.dart';

class UpdateUserNotifier extends AsyncNotifier<void> {
  @override
  void build() {}

  Future<void> updateUser({
    required Map<String, dynamic> data,
    required String id,
  }) async {
    state = const AsyncLoading();
    final service = ref.read(dataServiceProvider);
    final result = await service.updateData(
      endPoint: AppConsts.usersEndPoint,
      data: data,
      id: id,
    );
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (_) => const AsyncData('تم حفظ التعديلات بنجاح'),
    );
  }
}

final updateUserProvider = AsyncNotifierProvider<UpdateUserNotifier, void>(
  UpdateUserNotifier.new,
);
