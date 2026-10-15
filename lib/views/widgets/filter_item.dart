import 'package:flutter/material.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';

class const FilterItem({
  super.key,
  required this.title,
  this.isSelected = false,
  this.onTap,
}) extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInToLinear,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColors.primary),
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.background : AppColors.primary,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}