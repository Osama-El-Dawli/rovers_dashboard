
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rovers_dashboard/core/cache/prefs.dart';
import 'package:rovers_dashboard/core/di/get_it.dart';
import 'package:rovers_dashboard/core/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) => getIt<AuthService>(),
);

class AuthNotifier extends AsyncNotifier<AuthResponse?> {
  @override
  AuthResponse? build() => null;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final service = ref.read(authServiceProvider);
    final result = await service.login(
      email: email,
      password: password,
    );

    await result.fold(
      (failure) async {
        state = AsyncError(failure, StackTrace.current);
      },
      (response) async {
        await Prefs.setIsLoggedIn(true);
        state = AsyncData(response);
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final service = ref.read(authServiceProvider);
    final result = await service.register(
      email: email,
      password: password,
    );

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (response) => AsyncData(response),
    );
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthResponse?>(
  AuthNotifier.new,
);
