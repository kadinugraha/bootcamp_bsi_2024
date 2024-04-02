import 'package:flutter/cupertino.dart';
import 'package:flutter_review/domain/use_cases/get_articles.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/article.dart';
import '../../domain/entities/user.dart';

class ArticleProvider extends ChangeNotifier{
  var listArticle = <Article>[];
  final storage = new FlutterSecureStorage();
  SharedPreferences? prefs = null;
  var user = User(username: '', token: '');

  ArticleProvider(){
    init();
  }

  Future<void> init() async{
    prefs = await SharedPreferences.getInstance();
    var token = prefs?.getString('token') ?? '';
    var username = prefs?.getString('username') ?? '-';
    user.username = username;
    user.token = token;
  }

  void getArticles(String token) async{
    user.token = token;
    listArticle = await GetArticles().execute(user);
    notifyListeners();
  }
}