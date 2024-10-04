import 'package:ecommercerapp/pages/cart_page.dart';
import 'package:flutter/material.dart';

class Mysliverappbar extends StatelessWidget {
  final Widget? title;
  final Widget? background;
  const Mysliverappbar(
      {super.key, required this.title, required this.background});

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;

    return SliverAppBar(
      collapsedHeight: deviceheight * 0.11,
      expandedHeight: deviceheight * 0.37,
      pinned: true,
      floating: false,
      actions: [
        //cart icon
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
          ),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Sunset Dunner'),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: background,
        title: title,
        //mange text size

        expandedTitleScale: 1,
        titlePadding:
            const EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 0),
        centerTitle: true,
      ),
    );
  }
}
