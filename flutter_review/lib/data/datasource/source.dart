abstract class Source{
  Future<String> login(Map<String, dynamic> user);
  Future<String> getArticles(Map<String, dynamic> user);
}