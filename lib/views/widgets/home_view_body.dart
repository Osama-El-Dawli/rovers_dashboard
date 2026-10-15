import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';
import 'package:rovers_dashboard/providers/users_provider.dart';
import 'package:rovers_dashboard/views/widgets/filter_bar.dart';
import 'package:rovers_dashboard/views/widgets/user_list_view.dart';

class HomeViewBody extends ConsumerWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.card,
          onRefresh: () async {
            final filter = ref.read(selectedFilterProvider);
            ref.invalidate(userPovider(filter));
            await ref.read(userPovider(filter).future);
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: FilterBar(
                  onFilterChange: (value) {
                    ref.read(selectedFilterProvider.notifier).state = value;
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              UserListView(),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
