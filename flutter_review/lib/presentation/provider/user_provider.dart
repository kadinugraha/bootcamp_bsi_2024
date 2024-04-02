import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';
import '../../domain/use_cases/login.dart';

class UserProvider extends ChangeNotifier{
  User user = User(username: '', token: '');
  bool isLogin = false;
  String token = '';
  final storage = new FlutterSecureStorage();
  SharedPreferences? prefs = null;

  UserProvider(){
    init();
  }

  Future<void> init() async{
    prefs = await SharedPreferences.getInstance();
    isLogin = prefs?.getBool('isLogin') ?? false;
    print('isLogin: $isLogin');
  }

  Future<void> login(String username, String password) async{
    user = User(username: username, token: '');
    user.password = password;
    user = await Login().execute(user);
    if(user.token != null){
      print(user.token);
      token = user.token;
      await prefs?.setString('username', username);
      await prefs?.setString('token', token);
      await prefs?.setBool('isLogin', true);
      print('TOKEN: ${prefs?.getString('token') ?? '-'}');
      isLogin = true;
    }
    notifyListeners();
  }
}