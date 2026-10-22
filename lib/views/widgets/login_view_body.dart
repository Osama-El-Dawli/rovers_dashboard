import 'package:flutter/material.dart';
import 'package:rovers_dashboard/core/utils/app_assets.dart';
import 'package:rovers_dashboard/views/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Image.asset(AppAssets.imagesSplash, width: 250),
            Text(
              'سجل الدخول الى حسابك',
              style: TextStyle(fontSize: 22, fontWeight: .w500),
            ),
            SizedBox(height: 24),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
