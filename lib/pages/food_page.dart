import 'package:ecommercerapp/models/food.dart';
import 'package:ecommercerapp/models/restorant.dart';
import 'package:ecommercerapp/widget/mybuttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedaddons = {};
  FoodPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedaddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addtocart(Food food, Map<Addon, bool> selectedaddons) {
    List<Addon> currentselectedaddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedaddons[addon] == true) {
        currentselectedaddons.add(addon);
      }
    }

    context.read<Restorant>().addtocart(food, currentselectedaddons);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  widget.food.imagepath,
                  height: deviceheight * 0.5,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${widget.food.price.toString()} \$',
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.food.description,
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const Text(
                        'Add-ons',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            Addon addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '${addon.price.toString()} \$',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: widget.selectedaddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedaddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Mybuttom(
                        text: 'Add to cart ',
                        onTap: () =>
                            addtocart(widget.food, widget.selectedaddons),
                      ),
                      const SizedBox(
                        height: 35,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Opacity(
          opacity: 0.6,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            margin: const EdgeInsets.all(25),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
        )
      ],
    );
  }
}
