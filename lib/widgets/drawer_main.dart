import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/barcode_provider.dart';
import 'contace.dart';

class DrawerMain extends StatefulWidget {
  const DrawerMain({super.key});

  @override
  DrawerMainState createState() => DrawerMainState();
}

class DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    const primary = Color.fromARGB(255, 58, 74, 87); // Primary color
    const backgroundColor = Colors.white; // Background color

    return Drawer(
      backgroundColor: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/concept.png', // Path to your logo image
                  width: 250, // Adjust as needed
                  height: 250,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Consumer<BarcodeProvider>(
                    builder: (context, barcode, child) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.volume_up, color: primary),
                            title: const Text("Sound",
                                style: TextStyle(fontSize: 16)),
                            trailing: Switch(
                              value: !barcode.isMuted,
                              onChanged: (value) => barcode.toggleSound(),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.vibration, color: primary),
                            title: const Text("Vibration",
                                style: TextStyle(fontSize: 16)),
                            trailing: Switch(
                              value: !barcode.isVibrateOff,
                              onChanged: (value) => barcode.toggleVibration(),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.help, color: primary),
                            title: const Text("Help & Support",
                                style: TextStyle(fontSize: 16)),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ContactScreen()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
