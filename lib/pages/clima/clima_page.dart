import 'package:flutter/material.dart';
import 'package:sample/pages/clima/location_service.dart';
import 'package:http/http.dart' as http;

const apiKey = 'ce9d4917971b1d0fbf47a6282b0c26d8';

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
    getData(loc.latitude.toString(), loc.longitude.toString());
  }

  void getData(String lat, String lon) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
    var response = await http.get(url);
    print(response.body);
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
