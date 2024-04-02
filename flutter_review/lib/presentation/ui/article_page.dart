import 'package:flutter/material.dart';
import 'package:flutter_review/presentation/provider/article_provider.dart';
import 'package:flutter_review/presentation/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ArticleProvider>(context, listen: false).getArticles();

    return Scaffold(
      body: Consumer<ArticleProvider>(
        builder: (context, provider, child){
          return Container(
            child: ListView(
              children: List.generate(provider.listArticle.length, (i) {
                print(provider.listArticle[i].pic);

                return 
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(provider.listArticle[i].title)));
                      },
                    child: Card(
                      child: Column(
                        children: [
                          Text(provider.listArticle[i].title),
                          Text(provider.listArticle[i].details),
                          Text(provider.listArticle[i].publishDate),
                          Image.network(provider.listArticle[i].pic)
                        ],
                      ),
                    ),
                  );
              }),
            ),
          );
        },
      ),
    );
  }
}
