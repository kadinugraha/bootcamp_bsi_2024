import 'package:flutter_review/domain/entities/role.dart';

class User{
  String username;
  String password = '';
  String token;
  List<Role> roles = [];

  User({required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> json){
    return switch(json){{
      'Username': String username,
      'Token': String token,
    } => User(username: username, token: token),
    _ => throw const FormatException('Gagal membuat user')
    };
  }

  Map<String, dynamic> toJson(){
    return {
      'username': this.username,
      'password': this.password,
      'token': this.token
    };
  }
}