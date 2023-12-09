import 'package:flutter/material.dart';

import '../data/models/weather_model.dart';

class OtherInfo extends StatefulWidget {
  final WeatherModel? weatherData;
  const OtherInfo({super.key, required this.weatherData});

  @override
  State<OtherInfo> createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  late double windSpeed;
  late String windDirection;
  late double pressure;
  late int humidity;
  late int cloud;

  late String sunrise;
  late String sunset;
  late String moonrise;
  late String moonset;
  late String moon_phase;

  void initState(){
    super.initState();
    setState(() {
      windSpeed=widget.weatherData!.windSpeed ?? 0.0;
      windDirection=widget.weatherData!.windDirection ?? 'No data';
      pressure=widget.weatherData!.pressure;
      humidity=widget.weatherData!.humidity;
      cloud=widget.weatherData!.cloud;
      sunrise=widget.weatherData!.sunrise;
      sunset=widget.weatherData!.sunset;
      moonrise=widget.weatherData!.moonrise;
      moonset=widget.weatherData!.moonset;
      moon_phase=widget.weatherData!.moonphase;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(widget.weatherData==null){
      return CircularProgressIndicator();
    }
    return Container(
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('Weather:', style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.start,),
          ),
          Card(
            color: Colors.black45,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/wind_speed.png'),
                            height: 48,
                            width: 48,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Text('Wind speed, kmh', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                        ],
                      ),
                      Text('$windSpeed', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/wind_direction.png'),
                            height: 48,
                            width: 48,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Text('Wind direction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                        ],
                      ),
                      Text('$windDirection', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/pressure.png'),
                            height: 48,
                            width: 48,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Text('Pressure, mb', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                        ],
                      ),
                      Text('$pressure', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/humidity.png'),
                            height: 48,
                            width: 48,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Text('Humidity, %', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                        ],
                      ),
                      Text('$humidity', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/clouds.png'),
                            height: 48,
                            width: 48,
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Text('Cloud cover, %', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                        ],
                      ),
                      Text('$cloud', style: TextStyle(color: Colors.white),)
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('Astro:', style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.start,),
          ),
          Card(
              color: Colors.black45,
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/sunrise.png'),
                                height: 48,
                                width: 48,
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                              Text('Sunrise', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                            ],
                          ),
                          Text('$sunrise', style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/sunset.png'),
                                height: 48,
                                width: 48,
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                              Text('Sunset', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                            ],
                          ),
                          Text('$sunset', style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/moonrise.png'),
                                height: 48,
                                width: 48,
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                              Text('Moonrise', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                            ],
                          ),
                          Text('$moonrise', style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/moonset.png'),
                                height: 48,
                                width: 48,
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                              Text('Moonset', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                            ],
                          ),
                          Text('$moonset', style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/moon_phase.png'),
                                height: 48,
                                width: 48,
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                              Text('Moonphase', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),)
                            ],
                          ),
                          Text('$moon_phase', style: TextStyle(color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
