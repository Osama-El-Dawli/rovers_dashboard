import 'package:flutter/material.dart';
import 'package:rovers_dashboard/views/widgets/filter_item.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key, required this.onFilterChange});
  final ValueChanged<String> onFilterChange;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String selectedFilter = 'الكل';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterItem(
            title: 'الكل',
            isSelected: selectedFilter == 'الكل',
            onTap: () {
              setState(() => selectedFilter = 'الكل');
              widget.onFilterChange('الكل');
            },
          ),
          SizedBox(width: 8),
          FilterItem(
            title: 'ذكر',
            isSelected: selectedFilter == 'ذكر',
            onTap: () {
              setState(() => selectedFilter = 'ذكر');
              widget.onFilterChange('ذكر');
            },
          ),
          SizedBox(width: 8),
          FilterItem(
            title: 'انثى',
            isSelected: selectedFilter == 'انثى',
            onTap: () {
              setState(() => selectedFilter = 'انثى');
              widget.onFilterChange('انثى');
            },
          ),
          SizedBox(width: 8),
          FilterItem(
            title: 'جديد',
            isSelected: selectedFilter == 'جديد',
            onTap: () {
              setState(() => selectedFilter = 'جديد');
              widget.onFilterChange('جديد');
            },
          ),
          SizedBox(width: 8),
          FilterItem(
            title: 'تم تسجيله',
            isSelected: selectedFilter == 'تم تسجيله',
            onTap: () {
              setState(() => selectedFilter = 'تم تسجيله');
              widget.onFilterChange('تم تسجيله');
            },
          ),
        ],
      ),
    );
  }
}
