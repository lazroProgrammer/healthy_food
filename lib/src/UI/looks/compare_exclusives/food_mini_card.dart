import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/comparison_products_notifier.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/data_saver_img.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/img.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodMiniCard extends ConsumerWidget {
  const FoodMiniCard({super.key, required this.item, required this.last});
  final ProductHandler item;
  final bool last;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSaver = ref.watch(dataSaverNotifier);
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      decoration: BoxDecoration(
          color: Colors.blue[200], borderRadius: BorderRadius.circular(16)),
      child: Column(children: [
        (dataSaver)
            ? DataSaverImg(imageUrl: item.imageUrl)
            : CachedImg(imageUrl: item.imageUrl),
        Text(
          item.productName ?? "",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(item.barcode ?? "XXXXXXXXX"),
        IconButton(
            onPressed: () {
              if (!last) {
                ref.read(product1CompareNotifier.notifier).clear();
              } else {
                ref.read(product2CompareNotifier.notifier).clear();
              }
            },
            icon: Icon(Icons.cancel))
      ]),
    );
  }
}
