import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
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
                  child: Icon(Icons.compare),
                )),
            Text(
              "Compare products with just two clicks, get a simple side to side comparison",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      )),
    );
  }
}
