import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/product_notifier_v2.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/food_row2.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/product_widget2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResultListV2 extends ConsumerWidget {
  const ResultListV2({this.color, super.key});
  final Color? color;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    final products = ref.watch(productsListNotifier2);
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: (color != null)
            ? color
            : dark
                ? Colors.white10
                : Colors.white60,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.results,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            products.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_products_found,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => InkWell(
                              child: FoodRow2(item: products[index]),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductHandlerWidget(
                                        product: products[index])));
                              },
                            )),
                  ),
          ],
        ),
      ),
    );
  }
}
