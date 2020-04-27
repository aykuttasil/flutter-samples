import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample/pages/clima/location_service.dart';

class ClimaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      home: ClimaPage(),
    );
  }
}

class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var loc = LocationService();
    await loc.getCurrentLocation();

    print('lat: ${loc.latitude}, long: ${loc.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
