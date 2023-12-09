import 'hour_model.dart';

class WeatherModel{
  final String city;
  final double temp;
  final String condition;
  final double windSpeed;
  final String windDirection;
  final double pressure;
  final int humidity;
  final int cloud;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonphase;
  final List<HourModel> hourModel;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.condition,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.humidity,
    required this.cloud,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonphase,
    required this.hourModel
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
        city: json['location']['name'],
        temp: json['current']['temp_c'],
        condition: json['current']['condition']['text'],
        windSpeed: json['current']['wind_kph'],
        windDirection: json['current']['wind_dir'],
        pressure: json['current']['pressure_mb'],
        humidity: json['current']['humidity'],
        cloud: json['current']['humidity'],
        sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'],
        sunset: json['forecast']['forecastday'][0]['astro']['sunset'],
        moonrise: json['forecast']['forecastday'][0]['astro']['moonrise'],
        moonset: json['forecast']['forecastday'][0]['astro']['moonset'],
        moonphase: json['forecast']['forecastday'][0]['astro']['moon_phase'],
        hourModel: (json['forecast']['forecastday'][0]['hour'] as List<dynamic>).map((dynamic e)=>HourModel.fromJson(e as Map<String, dynamic>)).toList()
    );
  }
}