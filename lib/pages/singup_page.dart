import 'package:ecommercerapp/services/auth/authservices.dart';
import 'package:ecommercerapp/widget/mybuttom.dart';
import 'package:ecommercerapp/widget/mytextfiled.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  final onTap;
  const SingUpPage({super.key, this.onTap});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  singup() {
    //make instance from authservices
    final authservices = Authservices();
    //check password if is match -> create user
    if (_passwordcontroller.text == _confirmpasswordcontroller.text) {
      try {
        authservices.signup(
            _emailcontroller.text, _passwordcontroller.text, context);
      }
      //show errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(e.toString()),
            );
          },
        );
      }
    }
    //password not match
    else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('password not match'),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double devicewidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SizedBox(
          width: devicewidth * 0.90,
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // icon
                  Icon(
                    Icons.lock_open_outlined,
                    size: 100,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  SizedBox(
                    height: deviceheight * 0.025,
                  ),
                  //welcome text
                  const Text(
                    'welcome to FoodApp',
                    style: TextStyle(fontSize: 20, color: Colors.black38),
                  ),
                  SizedBox(
                    height: deviceheight * 0.025,
                  ),
                  //text filed
                  Mytextfiled(
                    hinttext: 'E M A I L',
                    controller: _emailcontroller,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: deviceheight * 0.025,
                  ),
                  Mytextfiled(
                    hinttext: 'P A S S W O R D',
                    controller: _passwordcontroller,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: deviceheight * 0.035,
                  ),
                  Mytextfiled(
                    hinttext: 'C O N F I R M  P A S S W O R D',
                    controller: _confirmpasswordcontroller,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: deviceheight * 0.035,
                  ),
                  // buttom
                  Mybuttom(
                    text: 'Sing Up',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        singup();
                      } else {
                        print('error in sing up page ');
                      }
                    },
                  ),
                  SizedBox(
                    height: deviceheight * 0.035,
                  ),
                  //dont have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t have account ?  ',
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      InkWell(
                        onTap: widget.onTap,
                        child: Text(
                          'Sing In',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
