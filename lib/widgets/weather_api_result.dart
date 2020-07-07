import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../widgets/list_section.dart';

class WeatherApiResult extends StatelessWidget {
  final Weather weather;

  WeatherApiResult(this.weather);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text('Number of results : ' + weather.count.toString()),
        ),
        ...listSections(weather.list)
        // Container(padding: EdgeInsets.all(16.0), child: ,),
      ],
    );
  }

  List<Widget> listSections(List<dynamic> list) {
    return list.map((item) => ListSection(item) ).toList();
  }

}
