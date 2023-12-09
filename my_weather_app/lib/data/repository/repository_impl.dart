import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/domain/repository/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RepositoryImplementation implements Repository{
  @override
  Future<WeatherModel> getWeatherData(String city) async{
    String url = 'https://api.weatherapi.com/v1/forecast.json?key=df5c5a0f512c425baf3102938231410&q=$city&days=1&aqi=no&alerts=no';
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      return WeatherModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load');
    }
  }
}