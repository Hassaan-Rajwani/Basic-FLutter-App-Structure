import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:task/src/pages/home/home.dart';
import 'package:task/src/pages/signin/signin.dart';
import 'package:task/src/utils/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isOnBoard = false;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    getDataFromStorage('token').then((value) => {
          if (value != null && value.isNotEmpty)
            isLogin = true
          else
            isLogin = false
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSplashScreen.withScreenFunction(
        splash: 'assets/splash.PNG',
        screenFunction: () async {
          return isLogin ? const Home() : const SignIn();
        },
        splashTransition: SplashTransition.scaleTransition,
        duration: 2000,
        animationDuration: const Duration(seconds: 2),
        splashIconSize: 500,
      ),
    );
  }
}
