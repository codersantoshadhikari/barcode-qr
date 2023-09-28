import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/all_providers.dart';
import 'screens/splash_screen.dart';
import 'utils/keys.dart';

void main() {
  runApp(MultiProvider(providers: providersAll, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      key: appKey,
      title: 'Barcode and QRcode Scanner',
      color: Colors.blueGrey,
      home: const SplashScreen(),
    );
  }
}

MaterialColor primary = Colors.indigo;
