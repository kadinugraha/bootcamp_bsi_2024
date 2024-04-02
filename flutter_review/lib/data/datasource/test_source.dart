import 'package:flutter_review/data/datasource/source.dart';

class TestSource extends Source{
  @override
  Future<String> login(Map<String, dynamic> user) async{
    return 'Test Login';
  }
}