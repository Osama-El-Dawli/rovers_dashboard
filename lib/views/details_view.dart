import 'package:flutter/material.dart';
import 'package:rovers_dashboard/models/user_model.dart';
import 'package:rovers_dashboard/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const new({super.key, required this.user});
  final UserModel user;

  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('بيانات الطالب'),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: DetailsViewBody(user: user),
    );
  }
}
