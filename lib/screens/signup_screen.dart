// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/reusable_widgets/reusable.widget.dart';
import 'package:firebase_signin/screens/home_screen.dart';
import 'package:firebase_signin/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
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
                    height: 20,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline,
                      false, _userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email Id", Icons.person_outline,
                      false, _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outlined, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, false, () {
                    var str = _emailTextController.text.split('@');
                    if (str.length != 2) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text("Error Invalid Email")));
                    } else if (str[1] != 'iitrpr.ac.in') {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text("Error Wrong Email Domain!")));
                    } else {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
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
                    }
                  }),
                  // firebaseUIButton(context, "Sign Up", () {
                  //       .then((value) {
                  //     Navigator.push(context,
                  //       MaterialPageRoute(
                  //           builder: (context) => HomeScreen()));
                  // });
                  // })
                ],
              ),
            ),
          ))),
    );
  }
}
