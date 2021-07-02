import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/httpException.dart';

class Auth with ChangeNotifier {
  late String tokenId;
  late DateTime experyDate;
  late String userId;

  Future<void> signUp(String email, String password) async {
    try{
      const stringUrl =
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCGs-W_odjZ2ki-C3HLvmT5wStKnLeCNag';
      var url = Uri.parse(stringUrl);
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );
      final responseData = json.decode(response.body);
      if(responseData['error']!=null)
        throw HttpException(responseData['error']['message']);
    }catch(error){
      throw error;
    }
  }

  Future<void> singIn(String email, String password) async {
    try{
      const stringUrl =
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCGs-W_odjZ2ki-C3HLvmT5wStKnLeCNag';
      var url = Uri.parse(stringUrl);
      final response = await http.post(url,body: json.encode({
        'email':email,
        'password':password,
        'returnSecureToken':true,
      }));
      final responseData = json.decode(response.body);
      if(responseData['error']!=null)
        throw HttpException(responseData['error']['message']);
    }catch(error){
      throw error;
    }
  }
}
