import 'package:ecommercerapp/models/restorant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Myrecepit extends StatelessWidget {
  const Myrecepit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15, top: 20),
      child: Center(
        child: Column(
          children: [
            Text(
              'thanks for your order',
              style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary)),
              child: Consumer<Restorant>(
                builder: (context, retorant, child) {
                  return Text(retorant.displayTheRecepit());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
