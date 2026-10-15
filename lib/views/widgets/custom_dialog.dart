import 'package:flutter/material.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.child, this.isWarning = false});

  final Widget child;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.muted,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 36, 16, 20),
                child: child,
              ),
              Positioned(
                top: -30,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.accent, AppColors.primary],
                    ),
                  ),
                  child: Icon(
                    isWarning
                        ? Icons.error_outline_rounded
                        : Icons.check_circle_outline_rounded,
                    color: AppColors.background,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
