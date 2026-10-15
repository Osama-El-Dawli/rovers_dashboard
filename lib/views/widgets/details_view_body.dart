import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rovers_dashboard/core/helper/flutter_toast.dart';
import 'package:rovers_dashboard/core/services/failure.dart';
import 'package:rovers_dashboard/core/utils/app_assets.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';
import 'package:rovers_dashboard/core/utils/app_consts.dart';
import 'package:rovers_dashboard/models/user_model.dart';
import 'package:rovers_dashboard/providers/delete_user_provider.dart';
import 'package:rovers_dashboard/providers/update_user_provider.dart';
import 'package:rovers_dashboard/providers/users_provider.dart';
import 'package:rovers_dashboard/views/widgets/custom_button.dart';
import 'package:rovers_dashboard/views/widgets/custom_dialog.dart';
import 'package:rovers_dashboard/views/widgets/info_section.dart';
import 'package:rovers_dashboard/views/widgets/user_avatar_section.dart';

class DetailsViewBody extends ConsumerWidget {
  const DetailsViewBody({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(deleteUserProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) {
          Navigator.pop(context);
          showToast(message: (e as Failure).message);
        },
        data: (_) {
          Navigator.pop(context);
          Navigator.pop(context);
          ref.invalidate(userPovider);
        },
        loading: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => Center(
              child: LottieBuilder.asset(
                AppAssets.lottiesFireLoading,
                width: 200,
                height: 200,
              ),
            ),
          );
        },
      );
    });

    ref.listen(updateUserProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) {
          Navigator.pop(context);
          showToast(message: (e as Failure).message);
        },
        data: (_) {
          Navigator.pop(context);
          Navigator.pop(context);
          ref.invalidate(userPovider);
          showToast(message: 'تم تسجيل الطالب بنجاح');
        },
        loading: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => Center(
              child: LottieBuilder.asset(
                AppAssets.lottiesFireLoading,
                width: 200,
                height: 200,
              ),
            ),
          );
        },
      );
    });

    final isDeleting = ref.watch(deleteUserProvider).isLoading;
    final isUpdating = ref.watch(updateUserProvider).isLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserAvatarSection(user: user),
          const SizedBox(height: 32),
          InfoSection(user: user),
          const SizedBox(height: 24),
          CustomButton(
            isSecondary: user.isSaved,
            onPressed: isDeleting || isUpdating
                ? null
                : () {
                    if (user.isSaved) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          isWarning: true,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'هل أنت متأكد من أنك تريد حذف هذا المستخدم',
                                style: TextStyle(
                                  color: AppColors.foreground,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: 'حذف',
                                      isSecondary: false,
                                      onPressed: isDeleting
                                          ? null
                                          : () {
                                              Navigator.pop(context);
                                              ref
                                                  .read(
                                                    deleteUserProvider.notifier,
                                                  )
                                                  .deleteUser(id: user.phone);
                                            },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CustomButton(
                                      text: 'إلغاء',
                                      isSecondary: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      ref
                          .read(updateUserProvider.notifier)
                          .updateUser(
                            data: {AppConsts.isSavedColumn: true},
                            id: user.phone,
                          );
                    }
                  },
            text: user.isSaved ? 'حذف' : 'تم التسجيل',
          ),
        ],
      ),
    );
  }
}
