//TODO: do the before comparison for better performance and try to find other solutions then doing a heavy calculation in the build

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthy_food/src/Notifiers/product_notifier_v2.dart';
import 'package:healthy_food/src/Notifiers/tags_notifier.dart';
import 'package:healthy_food/src/UI/looks/tags_selector_icon_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  String before = "";
  bool first = true;
  List<String> terms = List.from(TERMS);

  // [   'Apple',
  //   'Banana',
  //   'Pear',
  //   'Watermelons',
  //   'Oranges',
  //   'Blueberries',
  //   'Strawberries',
  //   'Raspberries',
  // ];

  final controller = SearchController();
  List<String> filteredTerms = [];
  String searchTerm = ""; // Store the current search term
  Timer? _debounce; // Timer for debouncing

  // Store previous filtered results for incremental filtering
  List<String> previousFiltered = [];
  String previousTerm = ""; // Store the last searched term for comparison

  List<String> filterTerms(String value) {
    final trimmedTerm = value.trim().toLowerCase(); // Normalize the search term
    if (trimmedTerm.isEmpty) {
      previousFiltered = List.from(terms);
      return previousFiltered; // Return all terms if the search term is empty
    }

    if (trimmedTerm.length > previousTerm.length &&
        previousFiltered.isNotEmpty) {
      // Incremental filtering: if the current term is an extension of the previous term
      previousFiltered = previousFiltered
          .where((term) => term.toLowerCase().contains(trimmedTerm))
          .toList();
    } else {
      // If it's not an extension, filter from the full list
      previousFiltered = terms
          .where((term) => term.toLowerCase().contains(trimmedTerm))
          .toList();
    }

    previousTerm = trimmedTerm; // Update the previous search term
    return previousFiltered;
  }

  void viewOnChanged(String value) {
    if (_debounce?.isActive ?? false)
      _debounce?.cancel(); // Cancel previous debounce if it exists
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // Call the search function after a delay
      setState(() {
        searchTerm = value; // Update the search term
        filteredTerms = filterTerms(searchTerm); // Filter terms based on input
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Cancel debounce on dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    filteredTerms = filterTerms(""); // Initialize with all terms
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(tagNotifierProvider);

    return SearchAnchor(
      isFullScreen: false,
      viewOnChanged: (value) {
        setState(() {});
      },
      builder: (context, controller) {
        return SearchBar(
          controller: controller,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          onTap: () => controller.openView(),
          onChanged: (value) => controller.openView(),
          leading: IconButton(
              onPressed: () async {
                if (controller.text.trim() != "") {
                  if (!terms.contains(controller.text.trim())) {
                    setState(() {
                      terms.insert(0, controller.text.trim());
                    });
                  }
                  await ref.read(productsListNotifier2.notifier).search(
                      limit: 5,
                      searchTerm: controller.text,
                      categories: categories);
                } else {
                  Fluttertoast.showToast(msg: "enter something");
                }
              },
              icon: Icon(Icons.search)),
          trailing: [
            Tooltip(
              message: "filter by..",
              child: IconButton(
                  onPressed: () async {
                    final selectedTags =
                        await showModalBottomSheet<List<String>>(
                      context: context,
                      builder: (BuildContext context) {
                        return CategorySelectorModal(
                          initialTags: ref.read(tagNotifierProvider),
                        );
                      },
                    );

                    // If a new selection is returned, update the global state via the provider
                    if (selectedTags != null) {
                      ref
                          .read(tagNotifierProvider.notifier)
                          .setTags(selectedTags);
                    }
                  },
                  icon: Icon((categories.isEmpty)
                      ? Icons.filter_list_off
                      : Icons.filter_list)),
            )
          ],
        );
      },
      suggestionsBuilder: (context, controller) {
        // return [SuggestionList(items: terms, controller: controller)];
        return filterTerms(controller.text)
            .map((String item) => Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    terms.remove(item);
                    // terms.remove(item);
                  });
                  Fluttertoast.showToast(msg: "$item removed from suggestions");
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  title: Text(item),
                  leading: Icon(Icons.drag_handle),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                )))
            .toList();
      },
    );
  }
}

// class SearchWidget extends ConsumerStatefulWidget {
//   const SearchWidget({super.key});

//   @override
//   ConsumerState<SearchWidget> createState() => _SearchWidgetState();
// }

// class _SearchWidgetState extends ConsumerState<SearchWidget> {
//   String before = "";
//   bool first = true;
//   List<String> terms = [
//     'Apple',
//     'Banana',
//     'Pear',
//     'Watermelons',
//     'Oranges',
//     'Blueberries',
//     'Strawberries',
//     'Raspberries',
//   ];

//   final controller = SearchController();
//   List<String> filteredTerms = [];
//   String searchTerm = ""; // Store the current search term
//   List<String> filterTerms(String value) {
//     final trimmedTerm = value.trim().toLowerCase(); // Normalize the search term
//     print("Searching for: '$trimmedTerm'"); // Debugging output

//     if (trimmedTerm.isEmpty) {
//       return List.from(terms); // Return all terms if the search term is empty
//     } else {
//       return terms
//           .where((term) => term.toLowerCase().startsWith(trimmedTerm))
//           .toList(); // Filter based on search term
//     }
//   }

//   void viewOnChanged(String value) {
//     setState(() {
//       searchTerm = value; // Update the search term
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     filterTerms("");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final categories = ref.watch(tagNotifierProvider);

//     return SearchAnchor(
//       isFullScreen: false,
//       viewOnChanged: (value) {
//         setState(() {});
//       },
//       builder: (context, controller) {
//         return SearchBar(
//           controller: controller,
//           padding: WidgetStatePropertyAll(
//             EdgeInsets.symmetric(horizontal: 16),
//           ),
//           onTap: () => controller.openView(),
//           onChanged: (value) => controller.openView(),
//           leading: IconButton(
//               onPressed: () async {
//                 if (controller.text.trim() != "") {
//                   if (!terms.contains(controller.text.trim())) {
//                     setState(() {
//                       terms.insert(0, controller.text.trim());
//                     });
//                   }
//                   await ref.read(productsListNotifier2.notifier).search(
//                       limit: 5,
//                       searchTerm: controller.text,
//                       categories: categories);
//                 } else {
//                   Fluttertoast.showToast(msg: "enter something");
//                 }
//               },
//               icon: Icon(Icons.search)),
//           trailing: [
//             Tooltip(
//               message: "filter by..",
//               child: IconButton(
//                   onPressed: () async {
//                     final selectedTags =
//                         await showModalBottomSheet<List<String>>(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return CategorySelectorModal(
//                           initialTags: ref.read(tagNotifierProvider),
//                         );
//                       },
//                     );

//                     // If a new selection is returned, update the global state via the provider
//                     if (selectedTags != null) {
//                       ref
//                           .read(tagNotifierProvider.notifier)
//                           .setTags(selectedTags);
//                     }
//                   },
//                   icon: Icon((categories.isEmpty)
//                       ? Icons.filter_list_off
//                       : Icons.filter_list)),
//             )
//           ],
//         );
//       },
//       suggestionsBuilder: (context, controller) {
//         // return [SuggestionList(items: terms, controller: controller)];
//         return filterTerms(controller.text)
//             .map((String item) => Dismissible(
//                 key: Key(item),
//                 onDismissed: (direction) {
//                   setState(() {
//                     terms.remove(item);
//                     // terms.remove(item);
//                   });
//                   Fluttertoast.showToast(msg: "$item removed from suggestions");
//                 },
//                 background: Container(
//                   color: Colors.red,
//                   alignment: Alignment.centerLeft,
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Icon(Icons.delete, color: Colors.white),
//                 ),
//                 child: ListTile(
//                   title: Text(item),
//                   leading: Icon(Icons.drag_handle),
//                   onTap: () {
//                     setState(() {
//                       controller.closeView(item);
//                     });
//                   },
//                 )))
//             .toList();
//       },
//     );
//   }
// }

// class SearchWidget extends ConsumerStatefulWidget {
//   const SearchWidget({super.key});

//   @override
//   ConsumerState<SearchWidget> createState() => _SearchWidgetState();
// }

// class _SearchWidgetState extends ConsumerState<SearchWidget> {
//   List<String> terms = [
//     'Apple',
//     'Banana',
//     'Pear',
//     'Watermelons',
//     'Oranges',
//     'Blueberries',
//     'Strawberries',
//     'Raspberries',
//   ];
//   List<String> filteredTerms = [];
//   final controller = SearchController();
//   void filterTerms() {
//     final searchTerm = controller.text
//         .trim()
//         .toLowerCase(); // Get the search term in lowercase

//     setState(() {
//       if (searchTerm.trim() == "") {
//         filteredTerms =
//             List.from(terms); // Reset to all terms if the search term is empty
//       } else {
//         filteredTerms = terms
//             .where((term) => term.toLowerCase().contains(searchTerm))
//             .toList(); // Filter based on search term
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(() {
//       filterTerms();
//     });
//   }

//   @override
//   void dispose() {
//     controller.removeListener(filterTerms); // Remove the listener
//     controller.dispose(); // Dispose the controller
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // filterTerms();
//     final categories = ref.watch(tagNotifierProvider);
//     final tags = ref.watch(tagNotifierProvider);

//     return SearchAnchor(
//       isFullScreen: false,
//       builder: (context, controller) {
//         return SearchBar(
//           controller: controller,
//           padding: WidgetStatePropertyAll(
//             EdgeInsets.symmetric(horizontal: 16),
//           ),
//           onTap: () => controller.openView(),
//           onChanged: (value) => controller.openView(),
//           leading: IconButton(
//               onPressed: () async {
//                 if (controller.text.trim() != "") {
//                   if (!terms.contains(controller.text.trim())) {
//                     setState(() {
//                       terms.insert(0, controller.text.trim());
//                     });
//                   }
//                   await ref.read(productsListNotifier2.notifier).search(
//                       limit: 5,
//                       searchTerm: controller.text,
//                       categories: categories);
//                 } else {
//                   Fluttertoast.showToast(msg: "enter something");
//                 }
//               },
//               icon: Icon(Icons.search)),
//           trailing: [
//             Tooltip(
//               message: "filter by..",
//               child: IconButton(
//                   onPressed: () async {
//                     final selectedTags =
//                         await showModalBottomSheet<List<String>>(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return CategorySelectorModal(
//                           initialTags: ref.read(tagNotifierProvider),
//                         );
//                       },
//                     );

//                     if (selectedTags != null) {
//                       ref
//                           .read(tagNotifierProvider.notifier)
//                           .setTags(selectedTags);
//                     }
//                   },
//                   icon: Icon((tags.isEmpty)
//                       ? Icons.filter_list_off
//                       : Icons.filter_list)),
//             )
//           ],
//         );
//       },
//       suggestionsBuilder: (context, controller) {
//         return terms
//             .map((String item) => Dismissible(
//                   key: Key(item),
//                   onDismissed: (direction) {
//                     setState(() {
//                       terms.remove(item);
//                       filteredTerms.remove(item);
//                     });
//                     Fluttertoast.showToast(
//                         msg: "$item removed from suggestions");
//                   },
//                   background: Container(
//                     color: Colors.red,
//                     alignment: Alignment.centerLeft,
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Icon(Icons.delete, color: Colors.white),
//                   ),
//                   child: ListTile(
//                     title: Text(item),
//                     leading: Icon(
//                         Icons.drag_handle), // Add draggable handle icon here
//                     onTap: () {
//                       setState(() {
//                         controller.closeView(item);
//                       });
//                     },
//                   ),
//                 ))
//             .toList();
//       },
//     );
//   }
// }

const TERMS = [
  'Apple',
  'Banana',
  'Pear',
  'Watermelon',
  'Oranges',
  'Blueberries',
  'Strawberries',
  'Raspberries',
  'Grapes',
  'Pineapple',
  'Mango',
  'Peach',
  'Plum',
  'Apricot',
  'Cherry',
  'Kiwi',
  'Papaya',
  'Passionfruit',
  'Lime',
  'Lemon',
  'Broccoli',
  'Carrot',
  'Spinach',
  'Kale',
  'Lettuce',
  'Cabbage',
  'Cauliflower',
  'Zucchini',
  'Tomato',
  'Cucumber',
  'Potato',
  'Sweet Potato',
  'Onion',
  'Garlic',
  'Pumpkin',
  'Beetroot',
  'Radish',
  'Turnip',
  'Parsnip',
  'Leek',
  'Rice',
  'Quinoa',
  'Barley',
  'Oats',
  'Corn',
  'Buckwheat',
  'Millet',
  'Spaghetti',
  'Macaroni',
  'Fettuccine',
  'Chicken',
  'Beef',
  'Pork',
  'Lamb',
  'Turkey',
  'Duck',
  'Goose',
  'Salmon',
  'Tuna',
  'Cod',
  'Milk',
  'Cheese',
  'Yogurt',
  'Butter',
  'Cream',
  'Eggs',
  'Cottage Cheese',
  'Sour Cream',
  'Parmesan',
  'Gouda',
  'Almonds',
  'Cashews',
  'Walnuts',
  'Hazelnuts',
  'Peanuts',
  'Pistachios',
  'Sunflower Seeds',
  'Pumpkin Seeds',
  'Chia Seeds',
  'Flax Seeds',
  'Olive Oil',
  'Coconut Oil',
  'Butter',
  'Margarine',
  'Avocado Oil',
  'Sunflower Oil',
  'Peanut Oil',
  'Canola Oil',
  'Sesame Oil',
  'Grapeseed Oil',
  'Dark Chocolate',
  'Honey',
  'Sugar',
  'Salt',
  'Pepper',
  'Basil',
  'Oregano',
  'Thyme',
  'Rosemary',
  'Paprika'
];
