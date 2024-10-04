import 'package:flutter/material.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, left: 25, right: 25, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver Now ',
            style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const Row(
            children: [
              Text('12568 egypet cairo '),
              Icon(Icons.keyboard_arrow_down_outlined)
            ],
          )
        ],
      ),
    );
  }
}
