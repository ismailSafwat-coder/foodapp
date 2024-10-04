import 'package:ecommercerapp/models/cart_item.dart';
import 'package:flutter/material.dart';

class MyCartPageTile extends StatelessWidget {
  final index;
  final resturant;
  const MyCartPageTile({
    super.key,
    required this.index,
    required this.usercart,
    required this.resturant,
  });

  final List<CartItem> usercart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          color: Theme.of(context).colorScheme.tertiary),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usercart[index].food.name,
                      style: const TextStyle(fontSize: 17),
                    ),
                    Text(
                      '${usercart[index].food.price.toString()} \$',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  resturant.removefromcart(usercart[index]);
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 25,
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  usercart[index].quntity.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  resturant.addtocart(usercart[index].food,
                                      usercart[index].selectedaddons);
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 25,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  usercart[index].food.imagepath,
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: usercart[index].selectedaddons.isEmpty ? 0 : 40,
            child: ListView.builder(
              itemCount: usercart[index].selectedaddons.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, addonindex) {
                final addon = usercart[index].selectedaddons[addonindex];
                return Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary),
                      color: Theme.of(context).colorScheme.secondary),
                  child: Row(
                    children: [
                      Text(
                        '${addon.name}  ',
                        style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      Text(
                        '${addon.price}\$',
                        style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
