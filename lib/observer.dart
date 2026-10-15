import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

base class AppObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    log(
      '[Provider] ${context.provider.name ?? context.provider.runtimeType} updated\n  prev: $previousValue\n  next: $newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    log(
      '[Provider] ${context.provider.name ?? context.provider.runtimeType} FAILED: $error',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    log(
      '[Provider] ${context.provider.name ?? context.provider.runtimeType} disposed',
    );
  }
}
