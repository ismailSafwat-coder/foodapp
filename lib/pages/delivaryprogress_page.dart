import 'package:ecommercerapp/widget/myrecepit.dart';
import 'package:flutter/material.dart';

class DelivaryprogressPage extends StatelessWidget {
  const DelivaryprogressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DelivaryprogressPage'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Myrecepit(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
              child: const Icon(
                Icons.person,
                size: 35,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ahmed elsayed',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary)),
                Text('Driver',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary))
              ],
            ),
            const SizedBox(
              width: 35,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: const Icon(
                    Icons.call,
                    size: 25,
                    color: Colors.green,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Icon(
                    Icons.message,
                    size: 25,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
