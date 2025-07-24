import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:healthy_food/src/Notifiers/database_specifics/meal_period_notifier.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/dashboard_specefic/goal_container.dart';
import 'package:healthy_food/src/UI/looks/dashboard_specefic/meal_period_widget2.dart';
import 'package:healthy_food/src/UI/pages/side_bar.dart';
import 'package:healthy_food/src/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const TYPE_LIST = ["Breakfast", "Lunch", "Evening tea", "Dinner", "Snacks"];

class Dashboard extends HookConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    final meal = ref.watch(mealPeriodsNotifier);
    final selectedMealPeriod = useState<String?>(TYPE_LIST[0]);
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
            Container(
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
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                TimeOfDay selectedTime = TimeOfDay.now()
                                    .replacing(hour: 0, minute: 0);
                                return AlertDialog(
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("cancel")),
                                    ElevatedButton(
                                        onPressed: () {
                                          ref
                                              .read(
                                                  mealPeriodsNotifier.notifier)
                                              .insert(
                                                  MealPeriodsCompanion.insert(
                                                type: selectedMealPeriod.value!,
                                                startTime: DateTime.now()
                                                    .copyWith(
                                                        hour: selectedTime.hour,
                                                        minute: selectedTime
                                                            .minute),
                                                endTime: DateTime.now()
                                                    .copyWith(
                                                        hour: selectedTime.hour,
                                                        minute: selectedTime
                                                            .minute),
                                              ));

                                          Navigator.pop(context);
                                        },
                                        child: Text("add"))
                                  ],
                                  content: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return SizedBox(
                                        height: 200,
                                        child: Form(
                                            child: Column(
                                          children: [
                                            Text(
                                              "Plan meal:",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                              child: ListTile(
                                                title: Text("meal type"),
                                                leading:
                                                    const Icon(Icons.dining),
                                                trailing:
                                                    DropdownButton<String>(
                                                  value:
                                                      selectedMealPeriod.value,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(
                                                      () {
                                                        selectedMealPeriod
                                                            .value = newValue;
                                                      },
                                                    );
                                                  },
                                                  items: TYPE_LIST.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 6),
                                              child: Row(
                                                children: [
                                                  Text(selectedTime
                                                      .format(context)),
                                                  IconButton(
                                                      onPressed: () async {
                                                        final TimeOfDay? picked =
                                                            await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime:
                                                                    selectedTime,
                                                                initialEntryMode:
                                                                    TimePickerEntryMode
                                                                        .input);
                                                        if (picked != null &&
                                                            picked !=
                                                                selectedTime) {
                                                          setState(() {
                                                            selectedTime =
                                                                picked;
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(
                                                          Icons.access_time))
                                                ],
                                              ),
                                            )
                                          ],
                                        )));
                                  }),
                                );
                              });
                        },
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
                      ),
                      IconButton(
                          onPressed: () async {
                            await ref.read(mealPeriodsNotifier.notifier).get();
                          },
                          icon: Icon(Icons.refresh))
                    ],
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: meal.length,
                    itemBuilder: (context, index) => MealPeriodWidget(
                      mealPeriod: meal.entries.elementAt(index).value,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
