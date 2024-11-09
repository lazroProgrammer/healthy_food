import "package:flutter/material.dart";

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Color.fromRGBO(250, 250, 250, 0.95),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
  primaryColor: Colors.deepOrange[500],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepOrange[400],
    foregroundColor: Colors.black,
  ),
);
