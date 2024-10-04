import 'package:flutter/material.dart';

class Mylisttile extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function() onTap;
  const Mylisttile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        text,
        style: TextStyle(
            fontSize: 17, color: Theme.of(context).colorScheme.inversePrimary),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 35,
      ),
    );
  }
}
