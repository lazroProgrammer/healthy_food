import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
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
                  child: Icon(Icons.settings_applications_rounded),
                )),
            Text(
              "Customize your app from the app settings (no ideas for a good slide to be honest)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      )),
    );
  }
}
