import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/future_product_notifer.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/Notifiers/tags_notifier.dart';
import 'package:healthy_food/src/UI/looks/selected_categories.dart';
import 'package:healthy_food/src/UI/looks/tags_selector_button.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:healthy_food/src/data%20classes/product.dart';
import 'package:healthy_food/src/logic%20based/code_reader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: add animation transition for the search/cancel button if logical
//TODO: add timeout thing here or in the product class
//TODO: adjust the exception toast here or in product class (not sure about the location)

class SearchFieldExpanded2 extends ConsumerStatefulWidget {
  const SearchFieldExpanded2({this.color, super.key});
  final Color? color;
  @override
  ConsumerState<SearchFieldExpanded2> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<SearchFieldExpanded2> {
  static const int WAIT_DURATION = 1;
  final formKey = GlobalKey<FormState>();
  bool disabledB = false;
  bool cancelB = false;
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final searchTEC = TextEditingController();
  final numberTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dark = ref.watch(darkmodeNotifier);
    final categories = ref.watch(tagNotifierProvider);
    final country = ref.watch(countryNotifier);
    final detailed = ref.watch(detailedSearchNotifier);
    return GestureDetector(
      onTap: () {
        _focusNode1.unfocus();
        _focusNode2.unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: (dark) ? Colors.white54 : Colors.black87),
            borderRadius: BorderRadius.circular(10),
            color: (widget.color != null)
                ? widget.color
                : (dark)
                    ? Colors.white10
                    : Colors.white60),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.search,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TextFormField(
                    focusNode: _focusNode1,
                    controller: searchTEC,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: AppLocalizations.of(context)!.product_name,
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextFormField(
                          focusNode: _focusNode2,
                          controller: numberTEC,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: AppLocalizations.of(context)!.number,
                            prefixIcon: const Icon(Icons.numbers),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (int.tryParse(value ?? "") == null) {
                              return "insert a number";
                            }
                            if (int.tryParse(value ?? "")! <= 0) {
                              return "insert a positive number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: TagSelectorButton(),
                    ),
                  ],
                ),
                const SelectedTagsWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: !cancelB
                          // ? search button
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(dark
                                      ? Colors.green[800]
                                      : Colors.green[200])),
                              onPressed: (disabledB)
                                  ? null
                                  : () {
                                      // await ref
                                      //     .read(productsListNotifier2.notifier)
                                      //     .search(
                                      //         searchTerm: searchTEC.text,
                                      //         categories: categories,
                                      //         country: ProductHandler
                                      //             .countriesList[country]
                                      //             .toLowerCase()
                                      //             .trim(),
                                      //         detailed: detailed);
                                      ref
                                              .read(productSearchParamsProvider
                                                  .notifier)
                                              .state =
                                          ProductSearchParams(
                                              searchTerm: searchTEC.text,
                                              categories: categories,
                                              country: ProductHandler
                                                  .countriesList[country]
                                                  .toLowerCase()
                                                  .trim(),
                                              detailed: detailed);
                                    },
                              child: Text(AppLocalizations.of(context)!.search),
                            )
                          //? cancel button
                          : ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll((dark)
                                      ? Colors.red[800]
                                      : Colors.red[200])),
                              onPressed: (disabledB)
                                  ? null
                                  : () {
                                      Product.cancelFetching();
                                      if (mounted) {
                                        setState(() {
                                          disabledB = !disabledB;
                                        });
                                      }
                                      Future.delayed(const Duration(
                                              seconds: WAIT_DURATION))
                                          .then(
                                        (_) {
                                          if (mounted) {
                                            setState(() {
                                              cancelB = !cancelB;
                                              disabledB = !disabledB;
                                            });
                                          }
                                        },
                                      );
                                    },
                              child: const Text(
                                "cancel",
                              )),
                    ),
                    Text(AppLocalizations.of(context)!.orDots),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            await barcodeScan();
                            // try {
                            //   Connection.internetConnection()
                            //       .then((isConnected) async {
                            //     if (isConnected) {
                            //       products = await Product.fetchFoodProducts(
                            //           limit: int.parse(numberTEC.text),
                            //           searchTerm: searchTEC.text);
                            //       setState(() {});
                            //     } else {
                            //       Fluttertoast.showToast(
                            //           msg: "check your internet connection");
                            //     }
                            //   });
                            // } on SocketException catch (_) {
                            //   Fluttertoast.showToast(
                            //       msg:
                            //           "address not found, please check your internet connection");
                            // }
                          },
                          child:
                              Text(AppLocalizations.of(context)!.scan_barcode)),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
