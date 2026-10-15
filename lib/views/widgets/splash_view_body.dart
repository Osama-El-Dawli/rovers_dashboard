import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rovers_dashboard/core/utils/app_assets.dart';

class SplashViewBody extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AppAssets.lottiesSplashLottie));
  }
}
