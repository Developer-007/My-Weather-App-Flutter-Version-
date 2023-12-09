import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/weather_model.dart';
import '../repository/repository.dart';

class GetDataUseCase{
  Repository repository;

  GetDataUseCase(this.repository);

  Future<WeatherModel> execute(String city) async {
    return await repository.getWeatherData(city);
  }
}