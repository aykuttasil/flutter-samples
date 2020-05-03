import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      home: PricePage(),
    );
  }
}

const kCurrencyList = <String>['TL', 'USD', 'EUR'];

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String selectedCurrency = kCurrencyList.first;

  Widget getAndroidDropdown() {
    var items = <DropdownMenuItem<String>>[];
    for (String item in kCurrencyList) {
      items.add(
        DropdownMenuItem<String>(
          child: Text(item),
          value: item,
        ),
      );
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  Widget getCupertinoPicker() {
    var items = <Text>[];
    for (String item in kCurrencyList) {
      items.add(Text(item));
    }
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 30,
        onSelectedItemChanged: (index) {},
        children: items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text('1 BTC = ???'),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            child: Platform.isIOS ? getCupertinoPicker() : getAndroidDropdown(),
          )
        ],
      ),
    );
  }
}
