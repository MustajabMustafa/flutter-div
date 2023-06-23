import 'package:ecommerce/screens/mainScreen.dart';
import 'package:ecommerce/screens/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController emailControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControl.text.trim(), password: passControl.text.trim());
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Colors.white, // Set the background color of the scaffold
        body: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(children: [
              const Image(
                image: AssetImage('assets/logos/logo-blue.png'),
                width: 428,
              ),
              TextField(
                controller: emailControl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: passControl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Text("Did not have account Signup?")),
              ElevatedButton(
                  onPressed: () {
                    login(context);
                  },
                  child: const Text("Login"))
            ]),
          ),
        ));
  }
}
