import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthy_food/src/Notifiers/database_specifics/product_in_meal_period.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/food_row_simplified.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:healthy_food/src/database/database.dart';
import 'package:healthy_food/src/logic%20based/scanner_page_add.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: decode value and unit from numberUnitTEC
class AddProducts extends ConsumerStatefulWidget {
  const AddProducts({super.key, required this.mealPeriod});
  final MealPeriod mealPeriod;

  @override
  ConsumerState<AddProducts> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<AddProducts> {
  late Future<List<ProductHandler>> futureGroceries;

  @override
  void initState() {
    super.initState();
    final products = ref.read(productsOfPeriodsNotifier);
    print("products:$products");
    futureGroceries = getProductsByBarcodes(products);
  }

  Future<List<ProductHandler>> getProductsByBarcodes(
      List<MealPeriodsToSavedProduct> products) async {
    if (products.isNotEmpty) {
      final barcodes = products
          .map((p) => p.productBarcode)
          .toSet()
          .toList(); // Ensure unique barcodes
      final results = <ProductHandler>[];

      for (var barcode in barcodes) {
        final product = await ProductHandler.fetchProductDataByCode(barcode);
        if (product != null) {
          results.add(product);
        }
      }
      return results;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final dark = ref.watch(darkmodeNotifier);
    final products = ref.watch(productsOfPeriodsNotifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
      ),
      body: FutureBuilder(
          future: futureGroceries,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final groceries = snapshot.data ?? [];
              return Container(
                margin: const EdgeInsets.all(8),
                child: ListView(
                  children: [
                    Text(
                      "id: ${widget.mealPeriod.id}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "type: ${widget.mealPeriod.type}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "startTime: ${widget.mealPeriod.startTime}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "endTime: ${widget.mealPeriod.endTime}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: dark ? Colors.white10 : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 6),
                      child: Column(
                        children: [
                          const Text("Products"),
                          ListView.builder(
                            itemCount: products.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              print("-----$groceries-----");
                              if (groceries.isNotEmpty) {
                                final productBarcode =
                                    products[index].productBarcode;
                                final grocery = groceries.firstWhere(
                                    (element) =>
                                        element.barcode! == productBarcode);

                                return FoodRowSimplified(
                                  item: grocery,
                                  unit: products[index].unit,
                                  value: products[index].value,
                                );
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text('No data available');
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final numberUnitTEC = TextEditingController();
          showDialog(
              context: context,
              builder: (context) {
                String barcode = "";
                TimeOfDay selectedTime =
                    TimeOfDay.now().replacing(hour: 0, minute: 0);
                return AlertDialog(
                  actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("cancel")),
                    ElevatedButton(
                        onPressed: () {
                          final measure = splitMeasure(numberUnitTEC.text);
                          if (measure.isNotEmpty) {
                            ref.read(productsOfPeriodsNotifier.notifier).insert(
                                MealPeriodsToSavedProductsCompanion.insert(
                                    idMealPeriod: widget.mealPeriod.id,
                                    productBarcode: barcode,
                                    unit: measure[1],
                                    value: double.parse(measure[0])));
                            Navigator.of(context).pop();
                          } else {
                            Fluttertoast.showToast(msg: "decoding not working");
                          }
                        },
                        child: Text("add"))
                  ],
                  content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return SizedBox(
                        height: 180,
                        child: Column(
                          children: [
                            Text(
                              "Plan meal:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: TextFormField(
                                controller: numberUnitTEC,
                                maxLength: 10,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "eg:(100ml)",
                                  prefixIcon: const Icon(Icons.abc),
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (!(int.tryParse(value ?? "") == null)) {
                                    return "don't insert numbers";
                                  }
                                  if (value == null || value.trim() == "") {
                                    return "enter a unit";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Text(barcode),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ScannerInserter(
                                            onReturn: (data) {
                                              setState(
                                                () {
                                                  barcode = data;
                                                },
                                              );
                                              Navigator.pop(
                                                  context); // Close the modal
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(AppLocalizations.of(context)!
                                        .barcode_scan)),
                              ],
                            ),
                          ],
                        ));
                  }),
                );
              });
        },
        child: Icon(Icons.post_add_sharp),
      ),
    );
  }
}

List<String> splitMeasure(String input) {
  List<String> measure = [];
  RegExp regex =
      RegExp(r'^(\d+)(\D+)$'); // Matches numbers followed by non-numbers
  Match? match = regex.firstMatch(input);

  if (match != null) {
    measure.add(match.group(1)!); // First group: Numbers
    measure.add(match.group(2)!); // Second group: Unit
  }
  return measure;
}
