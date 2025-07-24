import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/comparison_products_notifier.dart';
import 'package:healthy_food/src/UI/looks/compare_exclusives/comparison_result.dart';
import 'package:healthy_food/src/UI/looks/compare_exclusives/food_mini_card.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:healthy_food/src/logic%20based/scanner_page_compare.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ComparisonPage extends ConsumerStatefulWidget {
  const ComparisonPage({super.key});

  @override
  ConsumerState<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends ConsumerState<ComparisonPage> {
  bool _isloading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      // item1 = await ProductHandler.fetchProductDataByCode("3329770073265");
      // item2 = await ProductHandler.fetchProductDataByCode("3023291122005");
      if (mounted) {
        setState(() {
          _isloading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductHandler? item1 = ref.watch(product1CompareNotifier),
        item2 = ref.watch(product2CompareNotifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.compare_products),
        ),
        body: (_isloading)
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          (item1 == null)
                              ? scanButton(context, false)
                              : FoodMiniCard(item: item1, last: false),
                          (item2 == null)
                              ? scanButton(context, true)
                              : FoodMiniCard(item: item2, last: true)
                        ],
                      ),
                      ComparisonResult(item1: item1, item2: item2),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

Widget scanButton(BuildContext context, bool last) {
  return Container(
    width: MediaQuery.of(context).size.width / 2 - 20,
    height: MediaQuery.of(context).size.width / 2 - 20,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14), color: Colors.black12),
    child: Center(
      child: IconButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CompareScannerPage(
                  last: last,
                ))),
        icon: Icon(
          Icons.barcode_reader,
          color: Colors.blue,
        ),
      ),
    ),
  );
}
