import 'package:flutter_review/data/datasource/source.dart';

class ProductionSource extends Source{
  @override
  void login() {
    print('Production Login');
  }
}