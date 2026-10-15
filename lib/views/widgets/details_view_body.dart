import 'package:flutter/material.dart';
import 'package:rovers_dashboard/models/user_model.dart';
import 'package:rovers_dashboard/views/widgets/custom_button.dart';
import 'package:rovers_dashboard/views/widgets/custom_dialog.dart';
import 'package:rovers_dashboard/views/widgets/info_section.dart';
import 'package:rovers_dashboard/views/widgets/user_avatar_section.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserAvatarSection(user: user),
          const SizedBox(height: 32),
          InfoSection(user: user),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  isWarning: true,
                  child: Center(child: Text('تم الحفظ بنجاح')),
                ),
              );
            },
            text: 'تم الحفظ',
          ),
        ],
      ),
    );
  }
}
