import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/reusable_widgets/reusable.widget.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Course Portal!'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo1.png",
                    height: 100,
                    width: 100,
                  ),
                  Text(''),
                  Text('IIT Ropar'),
                ],
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Student Record'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Courses Available'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign Out!'),
              // Update the state of the app
              // ...
              // Then close the drawer
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print('Signed Out');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SigninScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
