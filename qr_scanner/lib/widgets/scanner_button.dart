import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async { 

        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //                                             '#3D8BEF', 
        //                                             'Cancelar', 
        //                                             false, 
        //                                             ScanMode.QR); //QR, Barcode, etc.

        final barcodeScanRes = 'https://facebook.com';
        print(barcodeScanRes);
      }
    );
  }
}