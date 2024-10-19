import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/data%20classes/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class FoodRow extends ConsumerStatefulWidget {
  final Product item;
  const FoodRow({required this.item, super.key});

  @override
  ConsumerState<FoodRow> createState() => _FoodRowState();
}

class _FoodRowState extends ConsumerState<FoodRow> {
  static List<String> paths = [];
  bool uno = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ref.watch(darkmodeNotifier);
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
      if (mounted) {
        setState(() {
          paths = paths;
        });
      }
      //assert(paths.isNotEmpty);
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      decoration: BoxDecoration(
          color: (dark) ? Colors.teal[800] : Colors.teal[200],
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  (widget.item.imageUrl != "")
                      ? Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              color:
                                  (dark) ? Colors.teal[200] : Colors.teal[100],
                              borderRadius: BorderRadius.circular(20)),
                          child: CachedNetworkImage(
                            key: UniqueKey(),
                            imageUrl: widget.item.imageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            width: 130,
                            height: 130,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) {
                              Logger().e("caching ERROR: $error");
                              return Image.network(
                                widget.item.imageUrl,
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: 130,
                          width: 130,
                          child: Image.asset("assets/misc/picture-icon.png")),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.productName,
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
                    height: 68,
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
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
