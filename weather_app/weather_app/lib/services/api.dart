import 'package:dio/dio.dart';
import 'package:weather_app/common/globals.dart' as globals;
import 'package:weather_app/models/weather.dart';

Dio dio = Dio(globals.dioBaseOptions);

class NewServiceApi{
  Future<Welcome> getWeather() async{
    try {
      final Response response = await dio.get('weather?q=Tashkent&appid=a1272e213cda69cf64efad55bd02ec55');
      print(response.data);
      Welcome welcome = Welcome.fromJson(response.data);
      return welcome;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}