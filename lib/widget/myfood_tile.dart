import 'package:ecommercerapp/models/food.dart';
import 'package:flutter/material.dart';

class MyfoodTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;

  const MyfoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '${food.price.toString()} \$',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        food.description,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    food.imagepath,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
