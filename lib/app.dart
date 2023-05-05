import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/src/pages/home/home.dart';
import 'package:task/src/pages/signin/signin.dart';
import 'package:task/src/pages/splash-screen/splash_screen.dart';
import 'package:task/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ms Global Task',
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        initialRoute: '/splash-screen',
        routes: {
          '/signin': (context) => const SignIn(),
          '/splash-screen': (context) => const SplashScreen(),
        });
  }
}
