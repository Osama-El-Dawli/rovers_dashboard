import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/user_list_view_item.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const UserListViewItem();
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
