import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasepractice/screens/loginView.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
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
      body: Column(
        children: [
          TextField(
            controller: semailControl,
          ),
          TextField(
            controller: spassControl,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView()));
              },
              child: const Text("Do you have account Login")),
          ElevatedButton(
              onPressed: () {
                signup(context);
              },
              child: const Text("signup"))
        ],
      ),
    );
  }
}
