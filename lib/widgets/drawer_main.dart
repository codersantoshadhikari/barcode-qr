import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../providers/barcode_provider.dart';
import 'contace.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(
                'https://santoshadhikary.github.io/Barcode-QR-scannerprivacypolicy/'), // URL of the privacy policy page
          ),
        ),
      ),
    );
  }
}

class DrawerMain extends StatefulWidget {
  const DrawerMain({Key? key}) : super(key: key);

  @override
  DrawerMainState createState() => DrawerMainState();
}

class DrawerMainState extends State<DrawerMain> {
  bool isDarkMode = false; // Add a dark mode flag

  @override
  Widget build(BuildContext context) {
    final primary = isDarkMode
        ? Colors.black
        : const Color.fromARGB(
            255, 58, 74, 87); // Define primary color based on dark mode

    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: SafeArea(
        child: Column(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/concept.png', // Replace with the path to your logo image
                  width: 250, // Adjust the width and height as needed
                  height: 250,
                ),
              ),
            ),
            Consumer<BarcodeProvider>(
              builder: (context, barcode, child) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Icon(Icons.volume_up, color: primary),
                      title:
                          const Text("Sound", style: TextStyle(fontSize: 16)),
                      trailing: Switch(
                        value: !barcode.isMuted,
                        onChanged: (value) => barcode.toggleSound(),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.vibration, color: primary),
                      title: const Text("Vibration",
                          style: TextStyle(fontSize: 16)),
                      trailing: Switch(
                        value: !barcode.isVibrateOff,
                        onChanged: (value) => barcode.toggleVibration(),
                      ),
                    ),
                    // Dark Mode Switch
                    ListTile(
                      leading: Icon(Icons.nightlight_round,
                          color: primary), // Add a dark mode icon
                      title: const Text("Dark Mode",
                          style: TextStyle(fontSize: 16)),
                      trailing: Switch(
                        value: isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            isDarkMode = value;
                          });
                        },
                      ),
                    ),
                    // About Section
                    ListTile(
                      leading: Icon(Icons.info, color: primary),
                      title: const Text(" Privacy Policy",
                          style: TextStyle(fontSize: 16)),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AboutPage()), // Navigate to the About Page
                        );
                      },
                    ),
                    // Help & Support Section
                    ListTile(
                      leading: Icon(Icons.help, color: primary),
                      title: const Text("Help & Support",
                          style: TextStyle(fontSize: 16)),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ContactScreen()),
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
    );
  }
}
