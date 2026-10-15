import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,

        title: Text(
          'FCI ROVERS',
          style: TextStyle(fontWeight: .w600, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: HomeViewBody(),
    );
  }
}
