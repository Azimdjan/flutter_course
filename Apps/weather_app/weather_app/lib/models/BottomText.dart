import 'package:flutter/material.dart';

class BottomText extends StatelessWidget{
  final String weatherText;
  final String humidity;
  final String visibility;
  final String temp;
  const BottomText({this.weatherText,this.humidity,this.visibility,this.temp});
  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints.expand(width: double.infinity,),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  if(this.weatherText == "Clear")
                    Icon(Icons.wb_sunny,size: 36,color: Colors.black,)
                  else if(this.weatherText == "Clouds")
                    Icon(Icons.cloud,size: 36,color: Colors.black,)
                  else
                    Icon(Icons.grain,size: 36,color: Colors.black,),
                  SizedBox(width: 5,),
                  Text(this.weatherText,style: TextStyle(fontSize: 36,color: Colors.black),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.arrow_drop_down_circle_sharp,color: Colors.black,),
                  SizedBox(width: 5,),
                  Text(this.humidity+"%",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold)),
                  SizedBox(width: 7,),
                  Icon(Icons.visibility,color: Colors.black,),
                  Text(this.visibility+"km",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
          SizedBox(width: 10,),
          Text(this.temp,style: TextStyle(fontSize: 108,fontWeight: FontWeight.bold,color: Colors.black),)
        ],
      ),
    );
  }
}