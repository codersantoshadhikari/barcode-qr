import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/barcode_provider.dart';
import '../utils/keys.dart';
import '../widgets/drawer_main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BarcodeProvider>(builder: (context, barcode, child) {
      return Scaffold(
        key: mainKey,
        drawer: const DrawerMain(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 156, 170, 178),
          title: const Text(
            "Barcode & QRcode Scanner",
            style: TextStyle(color: Colors.black),
          ),
        ),
        // backgroundColor: Colors.blueGrey,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            // backgroundColor: Colors.blueGrey,
            onPressed: () => barcode.scanBarcodeNormal(),
            label: const Row(
              children: [
                Icon(Icons.qr_code),
                SizedBox(width: 6),
                Text(
                  "Scan",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            )),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scanned Code",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 108),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  // color: const Color.fromARGB(255, 173, 171, 171),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primary)),
              child: SelectableText(barcode.barcodeScanRes,
                  style: const TextStyle(fontSize: 16)),
            )
          ],
        )),
      );
    });
  }
}
