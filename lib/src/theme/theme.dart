import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
      primaryColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 236, 19, 19),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins',
      elevatedButtonTheme: (ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 236, 19, 19),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            textStyle: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
            padding: const EdgeInsets.symmetric(vertical: 18)),
      )),
      textButtonTheme: (TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: const TextStyle(
              color: Color(0xFF0170D8),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            padding: const EdgeInsets.all(0)),
      )),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B2B2B)),
        headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        headline3: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF080A24),
        ),
        bodyText1: TextStyle(fontSize: 20.0),
        bodyText2: TextStyle(fontSize: 15.0, color: Color(0xFF172331)),
        button: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        iconColor: const Color.fromARGB(255, 122, 122, 122),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF0170D8), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFECF0F3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8)),
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 122, 122, 122), fontSize: 17.0),
      ));
}
