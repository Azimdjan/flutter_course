import 'package:dio/dio.dart';

const String baseUrl = "https://newsapi.org/v2/";
BaseOptions dioBaseOptions = BaseOptions(
  baseUrl: '$baseUrl',
  connectTimeout: 35000,
  receiveTimeout: 33000,
);