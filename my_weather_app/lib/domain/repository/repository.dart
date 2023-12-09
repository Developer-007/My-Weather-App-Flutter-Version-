import '../../data/models/weather_model.dart';

abstract class Repository{
  Future<WeatherModel> getWeatherData(String city);
}
