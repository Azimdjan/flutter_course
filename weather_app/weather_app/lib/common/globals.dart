import 'package:dio/dio.dart';

const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
BaseOptions dioBaseOptions = BaseOptions(
  baseUrl: '$baseUrl',
  connectTimeout: 35000,
  receiveTimeout: 33000
);