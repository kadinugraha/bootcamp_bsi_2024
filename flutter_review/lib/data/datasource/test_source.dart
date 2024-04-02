import 'package:flutter_review/data/datasource/source.dart';

class TestSource extends Source{
  @override
  void login() {
    print('Test Login');
  }
}