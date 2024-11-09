import 'package:flutter/material.dart';
import 'package:healthy_food/src/UI/pages/dashboard.dart';
import 'package:healthy_food/src/UI/pages/home_page.dart';
import 'package:healthy_food/src/UI/pages/side_bar.dart';

const SELECTION_COLOR = Colors.deepOrangeAccent;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      body: switch (_currentIndex) {
        0 => const Dashboard(),
        1 => Container(),
        2 => const HomePage(),
        // 3 => Container(),
        int() => null,
      },
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          // height: 56,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  shape: OvalBorder(),
                  textColor:
                      (_currentIndex == 0) ? SELECTION_COLOR : Colors.grey,
                  child: Column(
                    children: [
                      const Icon(Icons.dashboard),
                      Text("Dashboard",
                          style: TextStyle(
                              fontSize: (_currentIndex == 0) ? 13 : 12)),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  }),
              MaterialButton(
                  shape: OvalBorder(),
                  textColor:
                      (_currentIndex == 1) ? SELECTION_COLOR : Colors.grey,
                  child: Column(
                    children: [
                      const Icon(Icons.bar_chart_sharp),
                      Text(
                        "Analytics",
                        style:
                            TextStyle(fontSize: (_currentIndex == 1) ? 13 : 12),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  }),
              MaterialButton(
                  shape: OvalBorder(),
                  textColor:
                      (_currentIndex == 2) ? SELECTION_COLOR : Colors.grey,
                  child: Column(
                    children: [
                      const Icon(Icons.polyline),
                      Text("Activities",
                          style: TextStyle(
                              fontSize: (_currentIndex == 2) ? 13 : 12)),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  }),
              // MaterialButton(
              //     shape: OvalBorder(),
              //     textColor:
              //         (_currentIndex == 3) ? SELECTION_COLOR : Colors.grey,
              //     child: Column(
              //       children: [
              //         const Icon(Icons.person),
              //         Text("Me",
              //             style: TextStyle(
              //                 fontSize: (_currentIndex == 3) ? 13 : 12)),
              //       ],
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         _currentIndex = 3;
              //       });
              //     }),
            ],
          ),
        ),
        // currentIndex: _currentIndex,
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // }),
      ),
    );
  }
}
