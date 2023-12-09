import 'package:flutter/material.dart';

import '../data/models/hour_model.dart';

class HourWeatherCard extends StatefulWidget {
  final HourModel hourModel;

  const HourWeatherCard({super.key, required this.hourModel});

  @override
  State<HourWeatherCard> createState() => _HourWeatherCardState();
}

class _HourWeatherCardState extends State<HourWeatherCard> {

  late String time;
  late double temp;
  late String condition;
  late String condUrl;

  void initState(){
    super.initState();
    setState(() {
      time=widget.hourModel.time;
      temp=widget.hourModel.temp;
      condition=widget.hourModel.condition;
      condUrl=widget.hourModel.condUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$time', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                Text('$condition', style: TextStyle(color: Colors.white), textAlign: TextAlign.start)
              ],
            ),
            Text('$temp°C', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
            Image(image: NetworkImage('https:$condUrl'),)
          ],
        ),
      )
    );
  }
}
