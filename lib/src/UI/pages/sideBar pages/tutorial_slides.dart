import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            Container(
              color: Colors.orange,
              child: Center(child: Text("Page 1")),
            ),
            Container(
              color: Colors.red,
              child: Center(child: Text("Page 2")),
            ),
            Container(
              color: Colors.blue,
              child: Center(child: Text("Page 3")),
            ),
            Container(
              color: Colors.green,
              child: Center(child: Text("Page 4")),
            ),
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
                  _controller.animateToPage(3,
                      duration: Duration(milliseconds: 1500),
                      curve: Curves.decelerate);
                  setState(() {
                    index = 1;
                  });
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 18),
                )),
            SmoothPageIndicator(controller: _controller, count: 4),
            TextButton(
                onPressed: () {
                  if (index == 0) {
                    if (_controller.page != null && _controller.page! >= 2.0) {
                      setState(() {
                        index = 1;
                      });
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
