import 'package:ecommerce/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController semailControl = TextEditingController();
  TextEditingController spassControl = TextEditingController();
  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: semailControl.text.trim(),
        password: spassControl.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
                controller: semailControl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: spassControl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Text("Did not have account Signup?")),
            ]),
          ),
        ));
  }
}
