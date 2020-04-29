import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sample/pages/clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sample/pages/clima/services/networking.dart';

class ClimaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      home: ClimaLoadingPage(),
    );
  }
}

class ClimaLoadingPage extends StatefulWidget {
  @override
  _ClimaLoadingPageState createState() => _ClimaLoadingPageState();
}

class _ClimaLoadingPageState extends State<ClimaLoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var loc = LocationService();
    await loc.getCurrentLocation();

    print('lat: ${loc.latitude}, long: ${loc.longitude}');

    var networkHelper = NetworkHelper();
    var weatherData = await networkHelper.getWeatherData(
        loc.latitude.toString(), loc.longitude.toString());

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
