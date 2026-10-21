import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rovers_dashboard/core/services/failure.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:rovers_dashboard/models/user_model.dart';
import 'package:rovers_dashboard/providers/users_provider.dart';
import 'package:rovers_dashboard/views/widgets/user_list_view_item.dart';

class UserListView extends ConsumerWidget {
  const UserListView({super.key});

  static final _skeletonUsers = List.generate(
    10,
    (_) => UserModel(
      name: 'أسامة سعيد علي حسين الملا',
      phone: '01000000000',
      grade: 3,
      sex: 'ذكر',
      hobbies: null,
      isSaved: true,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(selectedFilterProvider);
    final usersAsync = ref.watch(userPovider(filter));

    return usersAsync.when(
      loading: () => _buildList(users: _skeletonUsers, isLoading: true),
      error: (error, stackTrace) {
        return SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 80,
                  color: AppColors.mutedForeground,
                ),
                SizedBox(height: 12),
                Text(
                  (error as Failure).message,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.mutedForeground,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => ref.invalidate(userPovider(filter)),
                  child: Text(
                    'حاول مرة اخرى',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      data: (users) => users.isEmpty
          ? _buildNoUsers()
          : _buildList(users: users, isLoading: false),
    );
  }

  Widget _buildNoUsers() {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_off_outlined,
              size: 80,
              color: AppColors.mutedForeground,
            ),
            SizedBox(height: 12),
            Text(
              'لا يوجد مستخدمين',
              style: TextStyle(fontSize: 16, color: AppColors.mutedForeground),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList({required List<UserModel> users, required bool isLoading}) {
    return Skeletonizer.sliver(
      effect: ShimmerEffect.dark(
        baseColor: AppColors.accentForeground.withValues(alpha: 0.3),
        highlightColor: AppColors.primary,
      ),
      enabled: isLoading,
      child: AnimationLimiter(
        child: SliverList.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              duration: Duration(milliseconds: 500),
              position: index,
              child: SlideAnimation(
                verticalOffset: 100,
                delay: Duration(milliseconds: 100),
                child: FadeInAnimation(
                  duration: Duration(milliseconds: 300),
                  child: UserListViewItem(user: users[index]),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}
