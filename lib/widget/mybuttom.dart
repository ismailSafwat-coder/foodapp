import 'package:flutter/material.dart';

class Mybuttom extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  const Mybuttom({super.key, this.onTap, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 17,
              color: Theme.of(context).colorScheme.inversePrimary),
        )),
      ),
    );
  }
}
