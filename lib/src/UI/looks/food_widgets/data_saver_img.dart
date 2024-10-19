import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:logger/logger.dart';

class DataSaverImg extends StatefulWidget {
  const DataSaverImg({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<DataSaverImg> createState() => _DataSaverImgState();
}

class _DataSaverImgState extends State<DataSaverImg>
    with AutomaticKeepAliveClientMixin {
  bool isClicked = false;
  bool isImageCached = false;

  @override
  void initState() {
    super.initState();
    // Check if the image is already cached without triggering a download
    _checkIfImageIsCached();
  }

  Future<void> _checkIfImageIsCached() async {
    try {
      final fileInfo =
          await DefaultCacheManager().getFileFromCache(widget.imageUrl);
      if (fileInfo != null) {
        // If the image exists in the cache, set isImageCached to true
        if (mounted) {
          setState(() {
            isImageCached = true;
          });
        }
      }
    } catch (e) {
      Logger().e("Error checking image cache: $e");
    }
  }

  @override
  bool get wantKeepAlive => isClicked;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        (widget.imageUrl == "")
            ? SizedBox(
                height: 130,
                width: 130,
                child: Image.asset("assets/misc/picture-icon.png"))
            : (!isClicked && !isImageCached)
                ? InkWell(
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          isClicked = true;
                        });
                      }
                    },
                    child: SizedBox(
                        height: 130,
                        width: 130,
                        child: const Center(child: Text("Click to load"))),
                  )
                : CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 130,
                      height: 130,
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
                      value: downloadProgress.progress,
                    ),
                    errorWidget: (context, url, error) {
                      Logger().e("Caching ERROR: $error");
                      return Image.asset("assets/misc/error.png");
                    },
                  ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
