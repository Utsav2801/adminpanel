import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_screen/dashboard.dart';
import 'package:login_screen/log_in_screen.dart';
import 'package:login_screen/utils/Constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => Constants.prefs!.getBool("loggedIn") == true
              ? Dashboard()
              : LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash_screen.gif",
              height: 120,
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 100),
              child: SizedBox(
                height: 100,
                width: double.maxFinite,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'ONLINE LR',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  totalRepeatCount: 3,
                  pause: const Duration(milliseconds: 1000),
                  stopPauseOnTap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
