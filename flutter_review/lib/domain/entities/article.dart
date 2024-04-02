class Article{
  String title;
  String details;
  String publishDate;
  String pic;

  Article({required this.title, required this.details, required this.publishDate, required this.pic});

  factory Article.fromJson(Map<String, dynamic> json){
    return switch(json){{
    'Title': String title,
    'Details': String details,
    'PublishDate': String publishDate,
    'Pic': String pic
    } => Article(title: title, details: details, publishDate: publishDate, pic: pic),
      _ => throw const FormatException('Gagal membuat article')
    };
  }
}