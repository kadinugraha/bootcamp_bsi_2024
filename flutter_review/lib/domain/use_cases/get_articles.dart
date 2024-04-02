import 'package:flutter_review/domain/entities/article.dart';

import '../../data/repository/user_repository.dart';
import '../entities/user.dart';

class GetArticles{
  var repository = UserRepository();

  Future<List<Article>> execute(User user){
    return repository.getArticles(user);
  }
}