import 'package:flutter/material.dart';
import 'package:rovers_dashboard/core/helper/handle_grade_name.dart';
import 'package:rovers_dashboard/models/user_model.dart';
import 'package:rovers_dashboard/views/widgets/info_card.dart';
import 'package:rovers_dashboard/views/widgets/section_label.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionLabel(label: 'معلومات الطالب'),
        const SizedBox(height: 12),
        InfoCard(icon: Icons.badge_outlined, label: 'الاسم', value: user.name),
        const SizedBox(height: 12),
        InfoCard(
          isPhone: true,
          icon: Icons.phone_outlined,
          label: 'رقم الهاتف',
          value: user.phone,
        ),
        const SizedBox(height: 12),
        InfoCard(
          icon: Icons.school_outlined,
          label: 'الفرقة',
          value: 'الفرقة ${handleGradeName(grade: user.grade)}',
        ),
        const SizedBox(height: 12),
        InfoCard(
          icon: user.sex == 'male' ? Icons.male_rounded : Icons.female_rounded,
          label: 'النوع',
          value: user.sex == 'male' ? 'ذكر' : 'أنثى',
        ),
        const SizedBox(height: 12),
        InfoCard(
          icon: Icons.color_lens,
          label: 'الهوايات والمواهب',
          value: user.hobbies ?? 'لا يوجد',
        ),
      ],
    );
  }
}
