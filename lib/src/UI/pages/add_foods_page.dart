import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/looks/meal_widget.dart';
import 'package:healthy_food/src/logic%20based/scanner_page_compare.dart';

class AddFoods extends StatelessWidget {
  const AddFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("enter something"),
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          child: ListView(
            children: [
              MealWidget(title: "Breakfast", subTitle: "10-02-2024"),
              MealWidget(title: "Lunch", subTitle: "10-02-2024"),
              MealWidget(title: "Dinner", subTitle: "10-02-2024"),
              MealWidget(title: "meal", subTitle: "10-02-2024"),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CompareScannerPage(
                            last: false,
                          ))),
                  child: Text(AppLocalizations.of(context)!.barcode_scan))
            ],
          ),
        ),
      ),
    );
  }
}
