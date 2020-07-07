class Weather {
  final String message;
  final String responseCode;
  final int count;
  final List<dynamic> list;

  Weather({this.message, this.responseCode, this.count, this.list});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      message: json['message'],
      responseCode: json['cod'],
      count: json['count'],
      list: json['list'],
    );
  }
}