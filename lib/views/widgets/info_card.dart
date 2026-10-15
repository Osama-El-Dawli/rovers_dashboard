import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rovers_dashboard/core/helper/flutter_toast.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isPhone = false,
  });
  final IconData icon;
  final String label;
  final String value;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        try {
          await Clipboard.setData(ClipboardData(text: value));
          await showToast(message: 'تم نسخ $label');
        } catch (e) {
          showToast(message: 'فشل نسخ $label');
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 16, top: 14, bottom: 14),
        decoration: BoxDecoration(
          color: AppColors.muted,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppColors.gradientAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColors.foreground, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.mutedForeground,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      color: AppColors.foreground,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            isPhone
                ? IconButton(
                    onPressed: () async {
                      try {
                        await Clipboard.setData(ClipboardData(text: value));
                        await showToast(message: 'تم نسخ $label');
                      } catch (e) {
                        showToast(message: 'فشل نسخ $label');
                      }
                    },
                    icon: Icon(Icons.copy_outlined, color: AppColors.primary),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
