import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/pages/compare_page.dart';
import 'package:healthy_food/src/UI/pages/formal_design_search2.dart';
import 'package:healthy_food/src/UI/pages/search_page.dart';
import 'package:healthy_food/src/UI/pages/side_bar.dart';
import 'package:healthy_food/src/logic%20based/scanner_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: add better names to the cards
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<HomePage> {
  List<bool> isClicked = List.filled(CARD_COUNT, false);
  //! if you change search card position change this
  static const SEARCH_CARD_INDEX = 2;
  static const CARD_COUNT = 6;
  static const BARCODE_INDEX = 3;
  // you can add barcode scan as a filler
  static const List<String> labels = [
    "Food tracker",
    "Analytics",
    "Search for a product",
    "barcode scan",
    "Compare products",
    "Recipe selector",
    "scores infos",
  ];
  String barcodeValue = "";
  static const List<IconData> icons = [
    Icons.fastfood_rounded,
    Icons.graphic_eq_rounded,
    Icons.content_paste_search_rounded,
    Icons.barcode_reader,
    Icons.compare_arrows_rounded,
    Icons.dinner_dining_rounded,
    Icons.info_outline,
  ];
  static final List<Widget?> widgets = [
    null,
    null,
    SearchPage(),
    ScannerPage(),
    ComparisonPage(),
    null,
  ];
  void _buttonEnlarge(int index) {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          isClicked[index] = false; // Revert scaling
        });
      }
    });
  }

  void _buttonShrink(int index) {
    if (mounted) {
      setState(() {
        isClicked[index] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizationMap = {
      "Food tracker": AppLocalizations.of(context)!.food_tracker,
      "Analytics": AppLocalizations.of(context)!.analytics,
      "Search for a product":
          AppLocalizations.of(context)!.search_for_a_product,
      "barcode scan": AppLocalizations.of(context)!.barcode_scan,
      "Compare products": AppLocalizations.of(context)!.compare_products,
      "Recipe selector": AppLocalizations.of(context)!.recipe_selector,
      "scores infos": AppLocalizations.of(context)!.food_tracker,
    };
    final dark = ref.watch(darkmodeNotifier);
    //! intential (- 1)
    final designIndex = ref.watch(appStyleNotifier) - 1;
    return SafeArea(
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.home),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.78),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(6),
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AnimatedScale(
                  scale: isClicked[index] ? 0.95 : 1.0,
                  duration: const Duration(milliseconds: 100),
                  child: Card(
                      elevation: (dark) ? 2 : 3,
                      shadowColor: (dark)
                          ? Colors.orange
                          // : Theme.of(context).primaryColor,
                          : Colors.deepOrange[500],
                      color: (dark) ? Colors.orange[800] : Colors.white60,
                      child: InkWell(
                        onTapUp: (details) => _buttonShrink(index),
                        onLongPress: () => _buttonShrink(index),
                        onTapCancel: () => _buttonEnlarge(index),
                        onTap: () {
                          _buttonShrink(index);
                          _buttonEnlarge(index);
                          if (widgets[index] != null) {
                            if (index == SEARCH_CARD_INDEX) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => (designIndex >= 0)
                                      ? FormalBubblesSearchPage2(
                                          designIndex: (dark)
                                              ? (2 * designIndex + 1)
                                              : (2 * designIndex))
                                      : SearchPage()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => widgets[index]!));
                            }
                          }
                        },
                        splashColor: (dark)
                            ? Colors.orange[700]
                            : const Color.fromARGB(255, 247, 201, 174),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(6, 4, 6, 6),
                                  // padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: FittedBox(
                                          child: (index == BARCODE_INDEX)
                                              ? Image.asset(
                                                  "assets/misc/barcode.png",
                                                  color: (dark)
                                                      ? Colors.white
                                                      : Colors.black,
                                                )
                                              : Icon(icons[index])))),
                              Text(
                                localizationMap[labels[index]]!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
