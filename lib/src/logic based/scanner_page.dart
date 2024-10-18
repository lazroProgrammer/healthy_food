import 'package:flutter/material.dart';
import 'package:healthy_food/src/UI/looks/food_widgets/package_based/product_widget_barcode.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});
  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller:
          MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates),
      onDetect: (barcodes) {
        print(barcodes.barcodes.first.rawValue);
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductHandlerBarcodeWidget(
              barcode: barcodes.barcodes.first.rawValue ?? ""),
        ));
      },
    );
  }
}
