import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../widgets/weather_api_result.dart';

Future<Weather> fetchWeather(String input) async {
  final _url =
      "https://community-open-weather-map.p.rapidapi.com/find?type=accurate&units=metric&q=$input";
  final _apiKey = '6773226ebamsh91f290dfb4363d2p1362eajsn616f5bb09e42';
  final _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
    "x-rapidapi-key": _apiKey,
  };
  final response = await http.get(_url, headers: _headers);

  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather');
  }
}

class ResultScreen extends StatefulWidget {
  final String input;

  ResultScreen(this.input);

  @override
  _ResultScreenState createState() => _ResultScreenState(input);
}

class _ResultScreenState extends State<ResultScreen> {
  Future<Weather> futureWeather;
  String input;

  _ResultScreenState(this.input);

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        // child: Text(widget.input),
        child: FutureBuilder(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WeatherApiResult(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
