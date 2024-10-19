import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/food_card2.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/nutrient_widget2.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';

class ProductHandlerBarcodeWidget extends StatefulWidget {
  final String barcode;

  const ProductHandlerBarcodeWidget({super.key, required this.barcode});

  @override
  State<ProductHandlerBarcodeWidget> createState() =>
      _ProductHandlerWidgetState();
}

class _ProductHandlerWidgetState extends State<ProductHandlerBarcodeWidget> {
  ProductHandler? product;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      product =
          await ProductHandler.fetchProductDataByCode(widget.barcode.trim());

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.product_details),
          // backgroundColor: ,
        ),
        body: (_isLoading)
            ? Center(child: CircularProgressIndicator())
            : (product == null)
                ? ErrorWidget("product not Found")
                : Container(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(shrinkWrap: true, children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FoodCard2(item: product!),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!
                                .nutritional_information,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          NutrientTableWidget2(
                            nutrients: product!.nutriments,
                          )
                        ],
                      ),
                    ]),
                  ),
      ),
    );
  }
}
