import 'package:ecommercerapp/models/food.dart';
import 'package:flutter/material.dart';

class Mytapbar extends StatelessWidget {
  final TabController tabController;

  const Mytapbar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildccategorytaps() {
    return Foodcategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Theme.of(context).colorScheme.primary,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      unselectedLabelColor: Colors.grey,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      controller: tabController,
      tabs: _buildccategorytaps(),
    );
  }
}
