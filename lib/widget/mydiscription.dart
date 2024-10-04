import 'package:flutter/material.dart';

class Mydiscription extends StatelessWidget {
  const Mydiscription({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimarytextstyle =
        TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.primary);
    var myInverPrimarytextstyle = TextStyle(
        fontSize: 17, color: Theme.of(context).colorScheme.inversePrimary);
    return Container(
      padding: const EdgeInsets.all(21.0),
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '\$ 0.99',
                style: myInverPrimarytextstyle,
              ),
              Text(
                'Delivery fee',
                style: myPrimarytextstyle,
              ),
            ],
          ),
          Column(
            children: [
              Text('10-15 min', style: myInverPrimarytextstyle),
              Text(
                'Delivery time',
                style: myPrimarytextstyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
