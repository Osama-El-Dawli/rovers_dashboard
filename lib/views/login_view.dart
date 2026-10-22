import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const new({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,

        title: Text('Login', style: TextStyle(fontWeight: .w600, fontSize: 24)),
        centerTitle: true,
      ),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
