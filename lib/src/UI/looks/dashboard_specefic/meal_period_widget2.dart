import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/database_specifics/meal_period_notifier.dart';
import 'package:healthy_food/src/Notifiers/database_specifics/product_in_meal_period.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/pages/add_products_of_meal_period.dart';
import 'package:healthy_food/src/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MealPeriodWidget extends ConsumerWidget {
  const MealPeriodWidget({super.key, required this.mealPeriod});
  final MealPeriod mealPeriod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),

      // padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (dark) ? Colors.orange[700]! : Colors.deepOrange[400]!,
        // color: (dark) ? Colors.white10 : Colors.white,
        // : Colors.black12
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          ref
              .read(productsOfPeriodsNotifier.notifier)
              .getByPeriodId(mealPeriod.id);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddProducts(mealPeriod: mealPeriod),
          ));
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      mealPeriod.type,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(mealPeriodsNotifier.notifier)
                              .delete(mealPeriod.id);
                        },
                        icon: Icon(Icons.close)),
                  ],
                )
              ],
            ),
            ListTile(
              title: Text("325 kcal"),
              trailing: Text(mealPeriod.startTime.toIso8601String()),
            ),
          ],
        ),
      ),
    );
  }
}
