import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/hour_weather_card.dart';

import '../data/models/hour_model.dart';
import '../data/models/weather_model.dart';

class HourData extends StatefulWidget {
  final WeatherModel weatherData;
  const HourData({super.key, required this.weatherData});

  @override
  State<HourData> createState() => _HourDataState();
}

class _HourDataState extends State<HourData> {

  late List<HourModel> weatherModel;

  void initState(){
    super.initState();
    setState(() {
      weatherModel=widget.weatherData!.hourModel;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: weatherModel.length ?? 0,
        itemBuilder: (BuildContext context, int index){
          return HourWeatherCard(hourModel: weatherModel[index]
          );
        }
      ),
    );
  }
}
