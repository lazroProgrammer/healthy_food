import 'package:flutter/material.dart';

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
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
                  child: Icon(Icons.dinner_dining_rounded),
                )),
            Text(
              "Search for recipes accoarding to the products you have",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      )),
    );
  }
}
