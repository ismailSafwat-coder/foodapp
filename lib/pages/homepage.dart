import 'package:ecommercerapp/models/food.dart';
import 'package:ecommercerapp/models/restorant.dart';
import 'package:ecommercerapp/pages/food_page.dart';

import 'package:ecommercerapp/widget/mydiscription.dart';
import 'package:ecommercerapp/widget/myfood_tile.dart';
import 'package:ecommercerapp/widget/mylocation.dart';
import 'package:ecommercerapp/widget/mydrawer.dart';

import 'package:ecommercerapp/widget/mysliverappbar.dart';
import 'package:ecommercerapp/widget/mytapbar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: Foodcategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Food> fillterfoodcategory(Foodcategory category, List<Food> fullmenu) {
    return fullmenu.where((food) => food.category == category).toList();
  }

  List<Widget> getfoodinthisCategory(List<Food> fullmenu) {
    return Foodcategory.values.map((category) {
      List<Food> foodmenu = fillterfoodcategory(category, fullmenu);
      return ListView.builder(
        itemCount: foodmenu.length,
        itemBuilder: (context, index) {
          Food food = foodmenu[index];
          return MyfoodTile(
            food: food,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FoodPage(
                    food: food,
                  ),
                ),
              );
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // double devicewidth = MediaQuery.of(context).size.width;
    // double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const Mydrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          Mysliverappbar(
            title: Mytapbar(tabController: tabController),
            background: Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    indent: 20,
                    endIndent: 20,
                  ),
                  //location
                  const MyLocation(),
                  // decription
                  const Mydiscription()
                ],
              ),
            ),
          )
        ],
        body: Consumer<Restorant>(
          builder: (context, restorant, child) {
            return TabBarView(
              controller: tabController,
              children: getfoodinthisCategory(restorant.menu),
            );
          },
        ),
      ),
    );
  }
}
