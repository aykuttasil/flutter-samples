import 'package:flutter/material.dart';

import 'pages/bitcoin_ticker/bitcoin_price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PriceScreen(),
    );
  }
}
