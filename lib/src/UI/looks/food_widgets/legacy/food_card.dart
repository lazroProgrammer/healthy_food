import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/looks/skelton.dart';
import 'package:healthy_food/src/data%20classes/product.dart';
import 'package:logger/logger.dart';

class FoodCard extends StatefulWidget {
  final Product item;
  const FoodCard({required this.item, super.key});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
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
      setState(() {
        paths = paths;
      });
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      decoration: BoxDecoration(
          color: Colors.teal[200], borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: (widget.item.imageUrl != "")
                ? Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: (widget.item.imageUrl == "")
                        ? Image.asset("assets/misc/picture-icon.png")
                        : CachedNetworkImage(
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
                          ))
                : Skelton(
                    width: MediaQuery.of(context).size.width - 70,
                    height: MediaQuery.of(context).size.height - 70),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.productName,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(AppLocalizations.of(context)!
                        .brandPut(widget.item.brand))),
                Text(
                  AppLocalizations.of(context)!.ingredients,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                for (var ingredient in widget.item.ingredients)
                  Text(
                    '- $ingredient',
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
          )
        ],
      ),
    );
  }
}
