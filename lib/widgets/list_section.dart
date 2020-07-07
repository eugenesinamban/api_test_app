import 'package:flutter/material.dart';

class ListSection extends StatelessWidget {
  final Map<String, dynamic> list;

  ListSection(this.list);

  @override
  Widget build(BuildContext context) {
    final String countryName = list['sys']['country'];
    final String temperature = list['main']['temp'].toString();
    final String areaName = list['name'];
    final String humidity = list['main']['huimdity'].toString();

    print(list);
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          Text('Area name : $areaName, $countryName'),
          Text('Temperature : $temperature'),
          Text('Humidity : $humidity'),
        ],
      ),
    );
  }
}
