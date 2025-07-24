import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MealPeriodPrototype extends ConsumerWidget {
  const MealPeriodPrototype(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      // padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        // color: (dark) ? Colors.white10 : Colors.white,
        // : Colors.black12
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0), // Flat bottom

              // color: (dark) ? Colors.white10 : Colors.white,
              color: (dark) ? Colors.orange[700]! : Colors.deepOrange[400]!,
              // : Colors.black12
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(title),
                  trailing: Text(subTitle),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("325 kcal"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
