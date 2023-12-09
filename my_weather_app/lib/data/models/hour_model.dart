class HourModel{
  final String time;
  final double temp;
  final String condition;
  final String condUrl;

  HourModel({
    required this.time,
    required this.temp,
    required this.condition,
    required this.condUrl,
});

  factory HourModel.fromJson(Map<String, dynamic> json){
    return HourModel(
      time: json['time'],
      temp: json['temp_c'],
      condition: json['condition']['text'],
      condUrl: json['condition']['icon'],
    );
  }
}