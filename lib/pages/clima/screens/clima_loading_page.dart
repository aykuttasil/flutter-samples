import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sample/pages/clima/screens/clima_location_screen.dart';
import 'package:sample/pages/clima/services/weather.dart';

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
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ClimaLocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
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
