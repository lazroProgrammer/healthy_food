import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthy_food/src/UI/looks/meal_widget.dart';
import 'package:healthy_food/src/UI/pages/add_foods_page.dart';
import 'package:table_calendar/table_calendar.dart';

class FoodTrackingPage extends StatefulWidget {
  const FoodTrackingPage({super.key});

  @override
  State<FoodTrackingPage> createState() => _FoodTrackingPageState();
}

class _FoodTrackingPageState extends State<FoodTrackingPage> {
  List<Color> color = [
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
    Colors.yellow[800]!
  ];
  final now = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
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
          child: ListView(children: [
            Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(24)),
                child: Center(
                  child: TableCalendar(
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, // Hide the format button
                      titleCentered: true, // Center the title if desired
                    ),
                    firstDay: DateTime.utc(2020, 10, 16),
                    lastDay: DateTime.now(),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay =
                            focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    weekendDays: [],
                    calendarFormat: CalendarFormat.month,
                    onFormatChanged: (format) => format,
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        return Container(
                          decoration: BoxDecoration(
                            color: color[Random().nextInt(color.length)],
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                    calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(color: Colors.brown)),
                  ),
                )),
            MealWidget(title: "Breakfast", subTitle: "10-02-2024"),
            MealWidget(title: "Lunch", subTitle: "10-02-2024"),
            MealWidget(title: "Dinner", subTitle: "10-02-2024"),
          ]),
        ),
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
