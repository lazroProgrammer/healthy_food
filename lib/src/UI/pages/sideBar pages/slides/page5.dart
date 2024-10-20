import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
          child: Container(
        margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
        // width: MediaQuery.of(context).size.width / 2 + 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                child: FittedBox(
                  child: Icon(Icons.graphic_eq_rounded),
                )),
            Text(
              "Track your consumed products and get accurate statistics to better your food habits",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      )),
    );
  }
}
