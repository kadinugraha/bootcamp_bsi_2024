import 'dart:convert';

import '../../domain/entities/user.dart';
import 'package:get_it/get_it.dart';

import '../datasource/source.dart';

final getIt = GetIt.instance;

class UserRepository{
  Future<User> login(User user) async{
    final source = getIt<Source>();
    var json = jsonDecode(await source.login(user.toJson()));
    return User.fromJson(json);
  }

  Future<List<Article>> getArticles(User user) async{
    final source = getIt<Source>();
    var json = jsonDecode(await source.getArticles(user.toJson()));
    return
  }
}