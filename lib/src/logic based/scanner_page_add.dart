import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class ScannerInserter extends StatefulWidget {
  final Function(String) onReturn;

  const ScannerInserter({required this.onReturn, super.key});

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerInserter> {
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      setState(() {
        _hasPermission = true;
      });
    } else {
      _showPermissionDialog();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Camera Permission Required"),
        content: Text(
            "This app needs camera access to scan barcodes. Please enable it in your device settings."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await openAppSettings(); // Open app settings
            },
            child: Text("Settings"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hasPermission
          ? MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates,
              ),
              onDetect: (barcodes) {
                print(barcodes.barcodes.first.rawValue);
                if (barcodes.barcodes.first.rawValue != null) {
                  widget.onReturn(barcodes.barcodes.first.rawValue!);
                }
              },
            )
          : Center(
              child: Text(
                "Waiting for camera permission...",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
    );
  }
}
