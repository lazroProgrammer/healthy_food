import 'package:flutter/material.dart';
import 'package:healthy_food/src/UI/pages/add_foods_page.dart';

class FoodTrackingPage extends StatelessWidget {
  const FoodTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor:
        //     (dark) ? Colors.black : Color.fromRGBO(255, 255, 255, 0.95),
        appBar: AppBar(
          title: Text("Food Tracker"),
        ),
        body: Container(
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text("food tracker"),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddFoods()));
          },
          child: Icon(Icons.post_add_sharp),
        ),
      ),
    );
  }
}
