import 'package:flutter/material.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';

class UserListViewItem extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.muted,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.mutedForeground),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: Icon(Icons.person_2, size: 40, color: AppColors.foreground),
        title: Text(
          'الاسم: أسامة سعيد',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.foreground,
          ),
        ),
        subtitle: Column(
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'النوع: ذكر',
                  style: TextStyle(
                    color: AppColors.mutedForeground,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Text(
                  'الفرقة: الثالثة',
                  style: TextStyle(
                    color: AppColors.mutedForeground,
                    fontSize: 14,
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          color: Colors.transparent,
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 28,
            color: AppColors.foreground,
          ),
        ),
      ),
    );
  }
}
