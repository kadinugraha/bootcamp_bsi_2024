import 'package:flutter/cupertino.dart';
import 'package:flutter_review/domain/use_cases/get_articles.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/article.dart';
import '../../domain/entities/user.dart';

class ArticleProvider extends ChangeNotifier{
  var listArticle = <Article>[];
  SharedPreferences? prefs = null;

  void getArticles() async{
    prefs = await SharedPreferences.getInstance();
    var username = await prefs?.getString('username') ?? '';
    var token = await prefs?.getString('token') ?? '';

    listArticle = await GetArticles().execute(User(username: username, token: token));
    notifyListeners();
  }
}