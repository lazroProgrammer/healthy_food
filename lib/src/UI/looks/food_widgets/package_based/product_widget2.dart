import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/food_card2.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/nutrient_widget2.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';

class ProductHandlerWidget extends StatelessWidget {
  final ProductHandler product;

  const ProductHandlerWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.product_details),
          // backgroundColor: ,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(shrinkWrap: true, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodCard2(item: product),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.nutritional_information,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                NutrientTableWidget2(
                  nutrients: product.nutriments,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
