import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/dashboard_specefic/goal_container.dart';
import 'package:healthy_food/src/UI/looks/meal_period.dart.dart';
import 'package:healthy_food/src/UI/pages/side_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(),
            Container(
                decoration: BoxDecoration(
                    color: dark ? Colors.white10 : Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                padding: EdgeInsets.fromLTRB(12, 6, 12, 12),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(Icons.date_range)),
                          Text("July 16 2020"),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GoalContainer(
                          title: "Water",
                          quantity: "1000 ml",
                          subTitle: "Daily goal 2L",
                          lightColor: Colors.blue[100]!,
                          darkColor: Colors.blue[600]!,
                          isWater: true,
                        ),
                        GoalContainer(
                          title: "Calories",
                          quantity: "500 kcal",
                          subTitle: "2000 kcal left",
                          lightColor: Colors.orange[300]!,
                          darkColor: Colors.orange[600]!,
                        )
                      ],
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: dark ? Colors.white10 : Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(top: 12, bottom: 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's meal plan",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 2),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                "edit plan",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    MealPeriodWidget(title: "Breakfast", subTitle: "7-11-2024"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
