import "package:flutter/material.dart";

final darkTheme = ThemeData.dark().copyWith(
  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: Colors.blueGrey,
  //   background: Colors.grey[900],
  // ),
  // brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal[900],
    foregroundColor: Colors.white,
  ),
);
