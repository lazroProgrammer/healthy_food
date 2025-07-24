import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/data_saver_img.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/img.dart';
import 'package:healthy_food/src/UI/looks/skelton.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double size = 150;

class FoodCard2 extends ConsumerStatefulWidget {
  final ProductHandler item;
  const FoodCard2({required this.item, super.key});

  @override
  ConsumerState<FoodCard2> createState() => _FoodCardState();
}

class _FoodCardState extends ConsumerState<FoodCard2> {
  static List<String> paths = [];
  bool uno = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (uno) {
      DefaultAssetBundle.of(context)
          .loadString('AssetManifest.json')
          .then((values) {
        final manifestJson = values;
        Map<String, dynamic> manifestMap = json.decode(manifestJson);
        for (var key in manifestMap.keys) {
          if (key.startsWith("assets/food/")) {
            paths.add(key);
          }
        }
      });
      uno = false;
      if (mounted) {
        setState(() {
          paths = paths;
        });
      }
    }
    final dark = ref.watch(darkmodeNotifier);
    final dataSaver = ref.watch(dataSaverNotifier);

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      decoration: BoxDecoration(
          color: (dark) ? Colors.blue[700] : Colors.blue[300],
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: (widget.item.imageUrl != "")
                      ? Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                              // color: Colors.teal[100],
                              borderRadius: BorderRadius.circular(20)),
                          child: (dataSaver)
                              ? DataSaverImg(
                                  imageUrl: widget.item.imageUrl,
                                  size: size,
                                )
                              : CachedImg(
                                  imageUrl: widget.item.imageUrl,
                                  size: size,
                                ),
                        )
                      : Skelton(width: size, height: size),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.productName ?? "unknown",
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text(AppLocalizations.of(context)!
                                .brandPut(widget.item.brand ?? "unknown"))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories:",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(widget.item.categories ?? "unknown"),
                Text(
                  AppLocalizations.of(context)!.ingredients,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(widget.item.ingredients ?? ""),
                // for (var ingredient in widget.item.ingredients)
                //   Text(
                //     '- $ingredient',
                //     softWrap: true,
                //     overflow: TextOverflow.fade,
                //   ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.item.quantity ?? "",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            height: 60,
                            child: Image.asset(
                              widget.item.getEcoScoreBadge(),
                            )),
                        SizedBox(
                            height: 60,
                            child: Image.asset(
                              widget.item.getNutriScoreIconPath(),
                            )),
                        Container(
                            padding: const EdgeInsets.all(2),
                            color: Colors.white,
                            height: 64,
                            child: Image.asset(widget.item.getNovaIconPath())),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
