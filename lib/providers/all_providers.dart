
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../utils/keys.dart';
import 'barcode_provider.dart';

List<SingleChildWidget> providersAll = [
  ChangeNotifierProvider<BarcodeProvider>(
      create: (context) => BarcodeProvider()),
];

var provdBarcode =
    Provider.of<BarcodeProvider>(appKey.currentContext!, listen: false);
