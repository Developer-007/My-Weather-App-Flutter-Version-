import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_weather_app/presentation/hour_data.dart';
import '../data/models/weather_model.dart';
import 'package:get_it/get_it.dart';
import '../domain/repository/repository.dart';
import '../domain/usecases/get_data_usecase.dart';
import 'AppModule.dart';
import 'other_info.dart';

void main() {
  GetIt getIt = GetIt.instance;
  AppModule().setup(getIt);
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late WeatherModel weatherData;
  String city='Moscow';
  double temp=0.0;
  String condition='';
  late GetDataUseCase getDataUseCase;

  void initState(){
    super.initState();
    getDataUseCase=GetIt.instance<GetDataUseCase>();
    getData();
  }

  Future<void> getData() async {
    try {
      weatherData = await getDataUseCase.execute('$city');
      setState(() {
        temp = weatherData.temp;
        condition=weatherData.condition;
      });
    } catch (e) {
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Error!'),
          content: Text('$e'),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            },
                child: Text('OК'))
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('My Weather App'),
            centerTitle: true,
            backgroundColor: Colors.black45,
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/clouds_paper.jpg'),
                    fit: BoxFit.cover
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Enter city:'),
                                  content: TextField(
                                    cursorColor: Colors.black45,
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    onChanged: (String cityValue){
                                      city=cityValue;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45)),
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.grey,
                                      filled: true,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(onPressed: () {
                                        getData();
                                        Navigator.of(context).pop();
                                      },
                                        child: Text('OК', style: TextStyle(color: Colors.black45)))
                                  ],
                                );
                              });
                            },
                            icon: Icon(Icons.search, color: Colors.white)),
                        IconButton(onPressed: () {
                          getData();
                        },
                            icon: Icon(Icons.sync, color: Colors.white))
                      ]
                    ),
                    Text('$city', style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text('$temp°C', style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('$condition', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Container(
                    color: Colors.black45,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          text: 'Hour data',
                        ),
                        Tab(
                          text:'Other Info',
                        )
                      ],
                    ),
                  ),
                ),
                ),
              Expanded(
                child: TabBarView(
                  children: [
                    HourData(weatherData: weatherData),
                    OtherInfo(weatherData: weatherData)
                  ],
                )
              )
            ],
          )
      ),
    );
  }
}


