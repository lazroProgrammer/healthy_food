import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/comparison_products_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CompareScannerPage extends ConsumerWidget {
  final bool last;
  const CompareScannerPage({super.key, required this.last});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MobileScanner(
      controller:
          MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates),
      onDetect: (barcodes) async {
        print(barcodes.barcodes.first.rawValue);
        if (!last) {
          ref
              .read(product1CompareNotifier.notifier)
              .search(barcode: barcodes.barcodes.first.rawValue ?? "")
              .then((value) {});
        } else {
          ref
              .read(product2CompareNotifier.notifier)
              .search(barcode: barcodes.barcodes.first.rawValue ?? "")
              .then((value) {});
        }
        Navigator.pop(context);
      },
    );
  }
}
