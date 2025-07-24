import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CachedImg extends StatelessWidget {
  const CachedImg({super.key, required this.imageUrl, this.size = 130});
  final double size;
  final String imageUrl;
  final bool dark = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (imageUrl != "")
            ? Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    color: (dark) ? Colors.teal[200] : Colors.teal[100],
                    borderRadius: BorderRadius.circular(20)),
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  width: size,
                  height: size,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) {
                    Logger().e("caching ERROR: $error");
                    return Image.network(
                      imageUrl,
                    );
                  },
                ),
              )
            : SizedBox(
                height: size,
                width: size,
                child: Image.asset("assets/misc/picture-icon.png")),
        // const SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
