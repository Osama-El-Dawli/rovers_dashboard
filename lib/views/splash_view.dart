import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const new({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(),
    );
  }
}
