import 'package:flutter/material.dart';

class Skelton extends Container {
  Skelton(
      {super.key,
      super.color = const Color.fromARGB(255, 224, 224, 224),
      super.width,
      super.height = 16,
      super.alignment = Alignment.centerLeft});
}

AppBar customAppBar({String title = ""}) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.teal[700],
    foregroundColor: Colors.white,
  );
}

Widget customBottomNavBar(
    {required int currentIndex, required void Function(int)? onTap}) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
      BottomNavigationBarItem(
          icon: Icon(Icons.local_pizza), label: "food items"),
    ],
    onTap: onTap,
  );
}
