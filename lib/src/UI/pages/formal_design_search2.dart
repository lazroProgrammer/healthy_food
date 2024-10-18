import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthy_food/src/UI/looks/search_field_expanded2.dart';
import 'package:healthy_food/src/UI/looks/search_page_exclusives/result_list_v2.dart';

const RECT_BORDER_RADIUS = 25.0;

class FormalBubblesSearchPage2 extends StatelessWidget {
  const FormalBubblesSearchPage2({required this.designIndex, super.key});
  final int designIndex;

  static const List<String> imgSrcs = [
    "assets/orange_bubbles.jpg",
    "assets/uneven_bubbles.jpg",
    "assets/white_curve.jpg",
    "assets/black_curve.jpg"
  ];
  static const List<Color> cardColors = [
    Colors.white54,
    Color(0x99506072),
    Color(0x99FFF9F9),
    Color(0x84405062)
  ];
  static const List<double> filterVals = [3, 3, 2, 3];
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    // child: Scaffold(
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("glass style search page"),
        backgroundColor: Colors.transparent,
      ),

      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              imgSrcs[designIndex],
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RECT_BORDER_RADIUS),
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              // margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
              child: ListView(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(RECT_BORDER_RADIUS),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: filterVals[designIndex],
                        sigmaY: filterVals[designIndex],
                        tileMode: TileMode.decal),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                      child: SearchFieldExpanded2(
                        color: cardColors[designIndex],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(RECT_BORDER_RADIUS),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: filterVals[designIndex],
                        sigmaY: filterVals[designIndex],
                        tileMode: TileMode.decal),
                    child: ResultListV2(color: cardColors[designIndex]),
                  ),
                ),
              ]),
            ),
          ),

          // Container(
          //   margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          // child:

          // ),
        ],
      ),
      // ),
    );
  }
}
