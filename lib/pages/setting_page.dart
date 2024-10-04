import 'package:ecommercerapp/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double devicewidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: deviceheight * 0.1,
            right: devicewidth * 0.072,
            left: devicewidth * 0.072),
        child: Column(
          children: [
            Container(
              height: deviceheight * 0.1,
              padding: EdgeInsets.symmetric(horizontal: deviceheight * 0.03),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'dark mode',
                    style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false)
                        .isdarkmode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggletheme();
                      setState(() {});
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
