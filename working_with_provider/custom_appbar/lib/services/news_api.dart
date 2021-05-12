import 'package:custom_appbar/model/article.dart';
import 'package:dio/dio.dart';
import 'package:custom_appbar/common/globals.dart' as globals;
import 'package:flutter/services.dart';

Dio dio = Dio(globals.dioBaseOptions);

class NewsApiService {
  Future<Welcome> getArticle() async {
    try{
      final Response response = await dio.get('everything?q=Apple&apiKey=71059a060729480c87097fc8d03d1f6f');
      print(response.data);
      Welcome welcome = Welcome.fromJson(response.data);
      return welcome;
    }catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}