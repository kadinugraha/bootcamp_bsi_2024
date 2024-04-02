import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/entities/user.dart';
import '../domain/use_cases/login.dart';

class UserProvider extends ChangeNotifier{
  User user = User(username: '', token: '');
  final storage = new FlutterSecureStorage();

  void login(String username, String password) async{
    user = User(username: username, token: '');
    user.password = password;
    user = await Login().execute(user);
    print(user.token);
    storage.write(key: 'token', value: user.token);
    storage.write(key: 'isLogin', value: 'true');
    notifyListeners();
  }
}