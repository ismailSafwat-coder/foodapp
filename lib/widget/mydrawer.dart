import 'package:ecommercerapp/pages/setting_page.dart';
import 'package:ecommercerapp/pages/singinorsingup_page.dart';
import 'package:ecommercerapp/services/auth/authservices.dart';
import 'package:ecommercerapp/widget/mylisttile.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    logout() {
      final authservices = Authservices();
      authservices.singout();
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Container(
        padding: EdgeInsets.only(top: deviceheight * 0.1),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.lock_open_outlined,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Mylisttile(
                text: 'H O M E',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              Mylisttile(
                text: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage())),
              ),
              const Spacer(),
              SizedBox(
                height: deviceheight * 0.4,
              ),
              Mylisttile(
                text: 'L O G O U T',
                icon: Icons.logout,
                onTap: () {
                  logout();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SingInOrSinUpPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
