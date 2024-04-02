import 'package:flutter_review/data/datasource/source.dart';

class TestSource extends Source{
  @override
  Future<String> login(Map<String, dynamic> user) async{
    return """
      {
        "Username": "usertest",
        "Token": "qwerty12345678"
      }
    """;
  }

  @override
  Future<String> getArticles(Map<String, dynamic> user) async{
    return """
      [
  {
    "ArticleID": 14,
    "CategoryID": 21,
    "Title": "CI Fundamental",
    "Details": "CI MVC",
    "PublishDate": "2024-02-29",
    "IsApproved": true,
    "Pic": "f577bc00-ed02-4f82-8dc5-e142f0449fcdcover2.jpeg",
    "Category": {
      "CategoryID": 21,
      "CategoryName": "Codeigniter"
    }
  },
  {
    "ArticleID": 22,
    "CategoryID": 1,
    "Title": "Coba Upload Article",
    "Details": "Coba Upload Article",
    "PublishDate": "2024-03-21",
    "IsApproved": true,
    "Pic": "02a17492-06cf-4e20-bb5e-ca4730198d28_cover1.jpg",
    "Category": {
      "CategoryID": 1,
      "CategoryName": "C#"
    }
  },
  {
    "ArticleID": 1,
    "CategoryID": 1,
    "Title": "CSharp Fundamental",
    "Details": "CSharp Fundamentals Training",
    "PublishDate": "2024-02-26",
    "IsApproved": false,
    "Pic": "satu.png",
    "Category": {
      "CategoryID": 1,
      "CategoryName": "C#"
    }
  },
  {
    "ArticleID": 12,
    "CategoryID": 11,
    "Title": "FSharp Fundamental",
    "Details": "FSharp Variable",
    "PublishDate": "2024-02-29",
    "IsApproved": true,
    "Pic": "47f49571-1b53-408c-9f6c-c3fb660faf35cover2.jpeg",
    "Category": {
      "CategoryID": 11,
      "CategoryName": "FSharp"
    }
  },
  {
    "ArticleID": 6,
    "CategoryID": 2,
    "Title": "Java EE",
    "Details": "Java EE",
    "PublishDate": "2024-02-26",
    "IsApproved": true,
    "Pic": "ad8f7a01-17ef-4082-ba60-ea9bd0b25624cover2.jpeg",
    "Category": {
      "CategoryID": 2,
      "CategoryName": "Java"
    }
  },
  {
    "ArticleID": 16,
    "CategoryID": 2,
    "Title": "Java FX",
    "Details": "Java FX for Desktop",
    "PublishDate": "2024-03-08",
    "IsApproved": true,
    "Pic": "6e17bb88-1fd7-4be1-9202-2f83e2c83bda_cover1.jpg",
    "Category": {
      "CategoryID": 2,
      "CategoryName": "Java"
    }
  },
  {
    "ArticleID": 3,
    "CategoryID": 3,
    "Title": "Java Kotlin",
    "Details": "Java Kotlin Basic OOP",
    "PublishDate": "2024-02-26",
    "IsApproved": true,
    "Pic": "8733d09c-fcb0-43f0-8896-4d9d445e1c19cover1.jpg",
    "Category": {
      "CategoryID": 3,
      "CategoryName": "Kotlin"
    }
  },
  {
    "ArticleID": 18,
    "CategoryID": 2,
    "Title": "Java Spring",
    "Details": "Java Spring Boot",
    "PublishDate": "2024-03-08",
    "IsApproved": true,
    "Pic": "60210807-97b1-493a-bbac-d24eaf3d5316_cover2.jpeg",
    "Category": {
      "CategoryID": 2,
      "CategoryName": "Java"
    }
  },
  {
    "ArticleID": 13,
    "CategoryID": 3,
    "Title": "Kotlin Fundamental",
    "Details": "Kotlin OOP",
    "PublishDate": "2024-02-29",
    "IsApproved": false,
    "Pic": "2b3352bd-e716-4528-9680-62dbb1c79f93cover1.jpg",
    "Category": {
      "CategoryID": 3,
      "CategoryName": "Kotlin"
    }
  },
  {
    "ArticleID": 15,
    "CategoryID": 7,
    "Title": "Spring Boot with ORM",
    "Details": "Spring Boot with ORM",
    "PublishDate": "2024-03-05",
    "IsApproved": false,
    "Pic": "f247deb8-b08a-418e-8d82-ec467643d250",
    "Category": {
      "CategoryID": 7,
      "CategoryName": "Spring Boot"
    }
  },
  {
    "ArticleID": 21,
    "CategoryID": 1,
    "Title": "Test Tambah Article 1",
    "Details": "Test Tambah Article 1",
    "PublishDate": "2024-03-21",
    "IsApproved": true,
    "Pic": "cover1.png",
    "Category": {
      "CategoryID": 1,
      "CategoryName": "C#"
    }
  },
  {
    "ArticleID": 23,
    "CategoryID": 21,
    "Title": "Test Update Article XX",
    "Details": "Test Update Article XX",
    "PublishDate": "0001-01-01",
    "IsApproved": true,
    "Pic": "cover1.png",
    "Category": {
      "CategoryID": 21,
      "CategoryName": "Codeigniter"
    }
  },
  {
    "ArticleID": 8,
    "CategoryID": 16,
    "Title": "T-SQL Advanced",
    "Details": "Transaction and CTE",
    "PublishDate": "2024-02-29",
    "IsApproved": false,
    "Pic": "satu.png",
    "Category": {
      "CategoryID": 16,
      "CategoryName": "Transact SQL"
    }
  },
  {
    "ArticleID": 7,
    "CategoryID": 16,
    "Title": "T-SQL Fundamental",
    "Details": "T-SQL SP",
    "PublishDate": "2024-02-29",
    "IsApproved": false,
    "Pic": "satu.jpg",
    "Category": {
      "CategoryID": 16,
      "CategoryName": "Transact SQL"
    }
  },
  {
    "ArticleID": 10,
    "CategoryID": 13,
    "Title": "Typescript Advanced",
    "Details": "Advanced OOP",
    "PublishDate": "2024-02-29",
    "IsApproved": false,
    "Pic": "0590bfa5-3c4e-45e4-bd3c-db6a7f585d29cover2.jpeg",
    "Category": {
      "CategoryID": 13,
      "CategoryName": "Typescript"
    }
  },
  {
    "ArticleID": 9,
    "CategoryID": 13,
    "Title": "Typescript Fundamental",
    "Details": "Typescript Variable and Looping",
    "PublishDate": "2024-02-29",
    "IsApproved": false,
    "Pic": "a11392a9-8be6-4c4e-9ecc-d95114d03080cover1.jpg",
    "Category": {
      "CategoryID": 13,
      "CategoryName": "Typescript"
    }
  }
]
    """;
  }
}