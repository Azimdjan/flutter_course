import 'package:custom_appbar/model/article.dart';
import 'package:custom_appbar/models/CardView.dart';
import 'package:custom_appbar/services/news_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget{
  NewsApiService welcome = NewsApiService();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Here is our data!!!",style: TextStyle(fontSize: 24),),
              SizedBox(height: 20,),
              Expanded(
                child: FutureBuilder<Welcome>(
                      future: welcome.getArticle(),
                      builder: (context, AsyncSnapshot<Welcome>snapshot){
                        if(snapshot.connectionState != ConnectionState.done){
                          return Center(child:CircularProgressIndicator());
                        }else {
                          var articles = snapshot.data.articles;
                          return ListView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                                scrollDirection: Axis.vertical,
                                itemCount: articles.length,
                                itemBuilder: (context, index) {
                                  return CardView(
                                    author: articles[index].author,
                                    title: articles[index].title,
                                    description: articles[index].description,
                                    publishTime: datetime(articles[index].publishedAt),
                                    img: articles[index].urlToImage,
                                  );
                                },
                              );
                        }
                      }),
              ),
            ],
          ),
        )
    );
  }
  String datetime(DateTime time){
    return time.toString();
  }
}