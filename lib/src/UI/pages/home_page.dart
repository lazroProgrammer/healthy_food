import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/pages/formal_design_search.dart';
import 'package:healthy_food/src/UI/pages/search_page.dart';
import 'package:healthy_food/src/UI/pages/side_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: add better names to the cards
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  //! if you change search card position change this
  static const SEARCH_CARD_INDEX = 2;
  static const CARD_COUNT = 6;
  // you can add barcode scan as a filler
  static const List<String> labels = [
    "Food tracker",
    "Analytics",
    "Search for a product",
    "Compare products",
    "Recipe selector",
    "scores infos",
  ];
  static const List<IconData> icons = [
    Icons.fastfood,
    Icons.graphic_eq,
    Icons.content_paste_search_rounded,
    Icons.compare_arrows_rounded,
    Icons.dinner_dining,
    Icons.info_outline,
  ];
  static const List<Widget?> widgets = [
    null,
    null,
    SearchPage(),
    null,
    null,
    null,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isClicked = useState(List.filled(CARD_COUNT, false));
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
                child: GestureDetector(
                  // onTap: () {
                  //   isClicked.value[index] = true;
                  //   Future.delayed(const Duration(milliseconds: 200), () {
                  //     isClicked.value[index] = false;
                  //   });
                  // },
                  child: AnimatedScale(
                    scale: isClicked.value[index] ? 0.9 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Card(
                        elevation: (dark) ? 2 : 3,
                        shadowColor: (dark)
                            ? Colors.orange
                            : Theme.of(context).primaryColor,
                        color: (dark) ? Colors.orange[800] : Colors.white60,
                        child: InkWell(
                          onTap: () {
                            isClicked.value[index] = true;
                            Future.delayed(const Duration(milliseconds: 200),
                                () {
                              isClicked.value[index] = false; // Revert scaling
                            });
                            if (widgets[index] != null) {
                              if (index == SEARCH_CARD_INDEX) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => (designIndex >= 0)
                                        ? FormalBubblesSearchPage(
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
                          splashColor: Colors.orange[700],
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
                                            child: Icon(icons[index])))),
                                Text(
                                  labels[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
