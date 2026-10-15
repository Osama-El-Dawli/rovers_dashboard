import 'package:flutter/material.dart';
import 'package:rovers_dashboard/models/user_model.dart';
import 'package:rovers_dashboard/views/details_view.dart';
import 'package:rovers_dashboard/views/home_view.dart';
import 'package:rovers_dashboard/views/splash_view.dart';

Route? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case DetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            DetailsView(user: settings.arguments as UserModel),
      );
  }
  return null;
}
