import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rovers_dashboard/core/di/get_it.dart';
import 'package:rovers_dashboard/core/router/router.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';
import 'package:rovers_dashboard/observer.dart';
import 'package:rovers_dashboard/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setup();
  await Supabase.initialize(
    url: 'https://bvzdxbywiiywfaaeitvf.supabase.co',
    publishableKey: 'sb_publishable_mgawxy2B_IYcGABEeMhYfg_7KngFXy0',
  );
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: Locale('ar'),
      child: ProviderScope(
        observers: [AppObserver()],
        child: const FciRoversApp(),
      ),
    ),
  );
}

class FciRoversApp extends StatelessWidget {
  const FciRoversApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashView.routeName,
      onGenerateRoute: onGenerateRoutes,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: .fromSeed(seedColor: AppColors.primary, brightness: .dark),
        fontFamily: 'Cairo',
      ),
    );
  }
}
