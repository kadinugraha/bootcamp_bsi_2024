import 'package:flutter_review/data/repository/user_repository.dart';

import '../entities/user.dart';

class Login{
  var repository = UserRepository();

  Future<User> execute(User user){
    return repository.login(user);
  }
}