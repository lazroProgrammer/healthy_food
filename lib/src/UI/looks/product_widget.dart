import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/looks/food_card.dart';
import 'package:healthy_food/src/UI/looks/nutrient_widget.dart';
import 'package:healthy_food/src/data%20classes/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.product_details),
          backgroundColor: Colors.teal[600],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(shrinkWrap: true, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodCard(item: product),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.nutritional_information,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                NutrientTableWidget(
                  nutrients: product.nutrients,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
