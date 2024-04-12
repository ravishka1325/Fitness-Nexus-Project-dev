import 'dart:async';
import 'package:gym_appfin/screens/onboarding_page.dart';
import 'package:gym_appfin/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
        
    Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
     });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(child: Image.asset('assets/images/splashImage.png')),
      ),
    );
  }
}