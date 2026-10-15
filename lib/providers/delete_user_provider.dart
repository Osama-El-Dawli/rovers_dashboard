import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rovers_dashboard/core/utils/app_consts.dart';
import 'package:rovers_dashboard/providers/users_provider.dart';

class DeleteUserNotifier extends AsyncNotifier<void> {
  @override
  void build() {}

  Future<void> deleteUser({required String id}) async {
    state = const AsyncLoading();

    final service = ref.read(dataServiceProvider);

    final result = await service.deleteData(
      endPoint: AppConsts.usersEndPoint,
      id: id,
    );

    state = result.fold(
      (failure) => AsyncError<void>(failure, StackTrace.current),
      (_) => const AsyncData<void>(null),
    );
  }
}

final deleteUserProvider = AsyncNotifierProvider<DeleteUserNotifier, void>(
  DeleteUserNotifier.new,
);
