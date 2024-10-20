import 'package:flutter/material.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/slides/page1.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/slides/page2.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/slides/page3.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/slides/page4.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/slides/page5.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/slides/page6.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const int PAGE_COUNT = 6;

//TODO: make the slides ui and text better and convincing
class TutorialSliders extends StatefulWidget {
  const TutorialSliders({super.key});

  @override
  State<TutorialSliders> createState() => _TutorialSlidersState();
}

class _TutorialSlidersState extends State<TutorialSliders> {
  int index = 0;
  List<String> buttonLabels = ["Next", "Okay"];
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          children: [
            Page1(), //orange
            Page2(), //green
            Page3(), //blue
            Page4(), //red
            Page5(), //teal
            Page6(), //indigo
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  _controller.animateToPage(PAGE_COUNT - 1,
                      duration: Duration(milliseconds: 500 * (PAGE_COUNT - 2)),
                      curve: Curves.decelerate);
                  if (mounted) {
                    setState(() {
                      index = 1;
                    });
                  }
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 18),
                )),
            SmoothPageIndicator(controller: _controller, count: PAGE_COUNT),
            TextButton(
                onPressed: () {
                  if (index == 0) {
                    if (_controller.page != null &&
                        _controller.page! >= PAGE_COUNT - 2) {
                      if (mounted) {
                        setState(() {
                          index = 1;
                        });
                      }
                    }
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  buttonLabels[index],
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
