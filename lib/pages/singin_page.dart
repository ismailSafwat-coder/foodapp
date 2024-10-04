import 'package:ecommercerapp/pages/homepage.dart';
import 'package:ecommercerapp/services/auth/authservices.dart';
import 'package:ecommercerapp/widget/mybuttom.dart';
import 'package:ecommercerapp/widget/mytextfiled.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  final onTap;
  const SingInPage({super.key, this.onTap});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void singin() async {
    final authservices = Authservices();
    String result = await authservices.signin(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
      context: context, // Pass the context here
    );

    if (result == 'succeed') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }
  }

  void singinWithGoogle() async {
    final authservices = Authservices();
    await authservices.signinWithGoogle(context);

    // Check if the user is signed in and navigate accordingly
    if (authservices.getcurrentuser() != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
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
                  // buttom
                  Mybuttom(
                    text: 'Sing In',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        singin();
                      } else {
                        print('error in singin page');
                      }
                    },
                  ),
                  SizedBox(
                    height: deviceheight * 0.035,
                  ),
                  Mybuttom(
                    text: 'Sign in with Google',
                    onTap: () {
                      singinWithGoogle(); // Call the Google sign-in function
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
                          'Sing Up',
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
