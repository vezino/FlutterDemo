import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/model/api_model.dart';
//import 'package:myapp/HomePage.dart';
//import 'package:flutter/material.dart';

//final _base = "https://home-hub-app.herokuapp.com";
final _base = "http://localhost:8000";
final _tokenEndpoint = "/api-token-auth/";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    print(Token.fromJson(json.decode(response.body)));
    return Token.fromJson(json.decode(response.body));
  } else {
    //Navigator.pop(context);
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}