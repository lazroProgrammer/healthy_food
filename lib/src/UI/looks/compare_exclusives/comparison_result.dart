import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/compare_exclusives/nutriment_comparison.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ComparisonResult extends ConsumerWidget {
  const ComparisonResult({super.key, required this.item1, required this.item2});
  final ProductHandler? item1;
  final ProductHandler? item2;
  static const Map<String, Color> CharColor = {
    "a": Colors.green,
    "b": Colors.lightGreen,
    "c": Colors.yellow,
    "d": Colors.orange,
    "e": Colors.red,
    "unknown": Colors.grey,
  };
  static const Map<String, Color> novaColors = {
    "1": Colors.green,
    "2": Colors.yellow,
    "3": Colors.orange,
    "4": Colors.red,
  };
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    //! do not remove this condition
    return (item1 == null || item2 == null)
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Enter products to get results",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          )
        : Container(
            margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: dark ? Colors.white10 : Colors.white60,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nutri-score:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        item1!.nutriScore?.toUpperCase() ?? "unknown",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: CharColor[item1!.nutriScore]),
                      ),
                      Text(
                        item2!.nutriScore?.toUpperCase() ?? "unknown",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: CharColor[item2!.nutriScore]),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nova group:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        item1!.novaGroup.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: novaColors[item1!.novaGroup.toString()]),
                      ),
                      Text(
                        item2!.novaGroup.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: novaColors[item2!.novaGroup.toString()]),
                      ),
                    ],
                  ),
                ),
                NutrimentComparisonTable(
                    item1: item1!.nutriments, item2: item2!.nutriments),
              ],
            ),
          );
  }
}
