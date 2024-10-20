import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
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
                  child: Icon(Icons.table_chart_rounded),
                )),
            Text(
              "Get a good and indicated measurment of product nutrients based on Healthy doses",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      )),
    );
  }
}
