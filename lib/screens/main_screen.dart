import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/barcode_provider.dart';
import '../utils/keys.dart';
import '../widgets/drawer_main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, });

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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.deepPurple,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            "Barcode & QRcode Scanner",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => barcode.scanBarcodeNormal(),
          label: const Row(
            children: [
              Icon(Icons.qr_code),
              SizedBox(width: 6),
              Text(
                "Scan",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
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
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primary),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectableText(
                        barcode.barcodeScanRes,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: barcode.barcodeScanRes,
                          ),
                        );

                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width * 0.5,
                          ),
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.minPositive,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: const Text(
                                'Copy Successfully',
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.copy_sharp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
