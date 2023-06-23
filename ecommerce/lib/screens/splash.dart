import 'dart:async';
import 'package:ecommerce/screens/Onboard.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnBoardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Colors.blue, // Set the background color of the scaffold
        body: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(children: const [
              Image(
                  image: AssetImage('assets/logos/logo-white.png'), width: 300)
            ]),
          ),
        ));
  }
}
