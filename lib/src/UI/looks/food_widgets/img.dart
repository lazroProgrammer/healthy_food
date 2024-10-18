import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CachedImg extends StatelessWidget {
  const CachedImg({super.key, required this.imageUrl});
  final String imageUrl;
  final bool dark = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (imageUrl != "")
            ? Container(
                width: 130,
                height: 130,
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
                  width: 130,
                  height: 130,
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
                height: 130,
                width: 130,
                child: Image.asset("assets/misc/picture-icon.png")),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
