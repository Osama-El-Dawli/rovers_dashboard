import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/filter_bar.dart';
import 'package:rovers_dashboard/views/widgets/user_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(child: FilterBar(onFilterChange: (value) {})),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          UserListView(),
        ],
      ),
    );
  }
}
