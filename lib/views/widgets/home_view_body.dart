import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/filter_bar.dart';
import 'package:rovers_dashboard/views/widgets/user_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 12),
          FilterBar(onFilterChange: (value) {}),
          SizedBox(height: 16),
          Expanded(child: UserListView()),
        ],
      ),
    );
  }
}
