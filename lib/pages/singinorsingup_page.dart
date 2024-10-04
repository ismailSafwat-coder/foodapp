import 'package:ecommercerapp/pages/singin_page.dart';
import 'package:ecommercerapp/pages/singup_page.dart';
import 'package:flutter/material.dart';

class SingInOrSinUpPage extends StatefulWidget {
  const SingInOrSinUpPage({super.key});

  @override
  State<SingInOrSinUpPage> createState() => _SingInOrSinUpPageState();
}

class _SingInOrSinUpPageState extends State<SingInOrSinUpPage> {
  bool singinpage = true;

  void toggelpage() {
    singinpage = !singinpage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (singinpage) {
      return SingInPage(onTap: toggelpage);
    } else {
      return SingUpPage(
        onTap: toggelpage,
      );
    }
  }
}
