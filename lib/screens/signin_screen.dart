import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_signin/reusable_widgets/reusable.widget.dart';
import 'package:firebase_signin/utils/color_utils.dart';
import 'package:firebase_signin/screens/signup_screen.dart';
import 'package:firebase_signin/screens/home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("2eb1e0"),
          hexStringToColor("dc71ea"),
          hexStringToColor("f7cadd")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    hexStringToColor("1233a1"),
                    hexStringToColor("0a1c57"),
                    hexStringToColor("09194e")
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  border: Border.all(color: Colors.black45, width: 2)),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/logo1.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Email", Icons.person_outline, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text("Error ${error.toString()}")));
                    });
                  }),
                  // forgetPassword(context),
                  // firebaseUIButton(context, "Sign In", () {
                  //   FirebaseAuth.instance
                  //       .signInWithEmailAndPassword(
                  //           email: _emailTextController.text,
                  //           password: _passwordTextController.text)
                  //       .then((value) {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => HomeScreen()));
                  //   });
                  // }),
                  signUpOption()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
