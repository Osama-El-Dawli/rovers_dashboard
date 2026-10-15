import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/user_list_view_item.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const UserListViewItem(isNewUser: true);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
