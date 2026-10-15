import 'package:flutter/material.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';
import 'package:rovers_dashboard/models/user_model.dart';

class UserAvatarSection extends StatelessWidget {
  const UserAvatarSection({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Glowing avatar circle
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.gradientHero,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.45),
                blurRadius: 28,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const Icon(
            Icons.person_2_rounded,
            size: 64,
            color: AppColors.primaryForeground,
          ),
        ),
        const SizedBox(height: 16),

        // Name
        Text(
          user.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.foreground,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 8),

        // Status badge
        _UserStatusBadge(isSaved: user.isSaved),
      ],
    );
  }
}

class _UserStatusBadge extends StatelessWidget {
  const _UserStatusBadge({required this.isSaved});
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSaved
            ? AppColors.accent.withValues(alpha: 0.25)
            : AppColors.primary.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSaved ? AppColors.accent : AppColors.primary,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSaved ? AppColors.accent : AppColors.primary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            isSaved ? 'محفوظ' : 'غير محفوظ',
            style: TextStyle(
              color: isSaved ? AppColors.accentForeground : AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
