import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'ce9d4917971b1d0fbf47a6282b0c26d8';

class NetworkHelper {
  Future getWeatherData(String lat, String lon) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
    print(url);
    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getDataFromUrl(String url) async {
    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
