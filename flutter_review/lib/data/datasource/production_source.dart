import 'dart:convert';

import 'package:flutter_review/data/datasource/source.dart';
import 'package:http/http.dart' as http;

class ProductionSource extends Source{
  static const URL = "https://app.actualsolusi.com/bsi/rest/api";

  @override
  Future<String> login(Map<String, dynamic> user) async{
    var response = await http.post(
      Uri.parse('$URL/Users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'Username': user['username'],
        'Password': user['password']
      })
    );
    return response.body;
  }
}