import 'package:flutter/material.dart';
import 'package:weather_app/models/BottomText.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/api.dart';

class MainScreen extends StatelessWidget{
  NewServiceApi welcome = NewServiceApi();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      constraints: BoxConstraints.expand(width: double.infinity,height: double.infinity),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://www.gazeta.uz/media/img/2018/07/K3DsO515317231991169_l.jpg'),
        )
      ),
      child: Column(
        children: [
          Center(
            child: Text("TODAY",style: TextStyle(fontSize: 28,fontFamily: 'Sans serif',fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 390,),
          Expanded(
            child: FutureBuilder<Welcome>( // ignore: missing_required_param
              future: welcome.getWeather(),
              builder: (context,snapshot){
                if(snapshot.connectionState !=ConnectionState.done){
                  return Center(child: CircularProgressIndicator(),);
                }
                else{
                  return BottomText(weatherText: snapshot.data.weather[0].main,
                  humidity: snapshot.data.main.humidity.toString(),
                  visibility: (snapshot.data.visibility/1000).toString(),
                  temp: kelvinToDegree(snapshot.data.main.temp));
                }
              },
            )
          ),
        ],
      ),
    );
  }

  String kelvinToDegree(double temp){
    double cur = temp - 273;
    return cur.toInt().toString();
  }
}