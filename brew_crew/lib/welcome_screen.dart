import 'package:brew_crew/main.dart';
import 'package:brew_crew/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:brew_crew/data_files/coworker_data.dart';
import 'package:brew_crew/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {



  //handles user input from text
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text("Email"),
          TextField(
            controller: emailController,
          ),
          Text("Password"),
          TextField(
            controller: passwordController,
          ),
          ElevatedButton(onPressed: () {

            //1. get email and password from user
            //debugging
            print(emailController.text);
            print(passwordController.text);

            //2. sent it to Firebase auth
            try {

              Future<UserCredential> result = FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
              result.then((value) => { print("Successfully signed in!") }); //if the sign up was successful, print message to console

            } on FirebaseAuthException catch (e) {  //catches relevant errors

              if(e.code == 'weak-password') {
                print('The password is too weak. Try something stronger.');
              }
              else if(e.code == 'email-already-in-use') {
                print('That email is already being used. Try a different valid one or sign in instead.');
              }

            }

            //3. move to next page
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "Welcome, "))
            );


          },
              child: Text("Sign up")),
          TextButton(onPressed: () {

            //1. Get email and password

            //2. Check if this is a legit user

            //3. move to next screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: "Welcome, "))
            );



          }, child: Text("Login"))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
