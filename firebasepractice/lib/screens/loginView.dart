import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasepractice/screens/homeView.dart';
import 'package:firebasepractice/screens/signUpView.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController emailControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  @override
  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControl.text.trim(), password: passControl.text.trim());
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 249, 249),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome back to mega mall",
            style: TextStyle(fontSize: 35),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupView()));
              },
              child: const Text("Did not have account Signup?")),
          ElevatedButton(
              onPressed: () {
                login(context);
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
