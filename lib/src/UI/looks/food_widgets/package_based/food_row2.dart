import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/data_saver_img.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/img.dart';
import 'package:healthy_food/src/data%20classes/open_food_pub/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodRow2 extends ConsumerStatefulWidget {
  final ProductHandler item;
  const FoodRow2({required this.item, super.key});

  @override
  ConsumerState<FoodRow2> createState() => _FoodRowState();
}

class _FoodRowState extends ConsumerState<FoodRow2> {
  static List<String> paths = [];
  bool uno = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ref.watch(darkmodeNotifier);
    final dataSaver = ref.watch(dataSaverNotifier);
    if (uno) {
      DefaultAssetBundle.of(context)
          .loadString('AssetManifest.json')
          .then((value) {
        Map<String, dynamic> manifestMap = json.decode(value);
        for (var key in manifestMap.keys) {
          if (key.startsWith("assets/food/")) {
            paths.add(key);
          }
        }
      });

      uno = false;
      setState(() {
        paths = paths;
      });
      //assert(paths.isNotEmpty);
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      decoration: BoxDecoration(
          // color: (dark) ? Colors.teal[800] : Colors.teal[200],
          color: (dark) ? Colors.blue[700] : Colors.blue[200],
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Row(
            children: [
              (dataSaver)
                  ? DataSaverImg(imageUrl: widget.item.imageUrl)
                  : CachedImg(imageUrl: widget.item.imageUrl),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.productName ?? "unknown",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  /* this is a generic look for a description or ingredient... */
                  // const SizedBox(height: 14),
                  // Skelton(),
                  // const SizedBox(height: 8),
                  // Skelton(),
                  // const SizedBox(height: 14),

                  SizedBox(
                    height: 54,
                    child: Text("Brand: ${widget.item.brand}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ))
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: const EdgeInsets.all(2),
                    color: Colors.white,
                    height: 64,
                    child: Image.asset(widget.item.getEcoScoreBadge())),
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
            ),
          )
        ],
      ),
    );
  }
}
