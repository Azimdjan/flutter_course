import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Quiz App"),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Column(
                children: <Widget>[
                  Image.network("${Recipe.samples[index].imageUrl}"),
                  Text("${Recipe.samples[index].label}"),
                ],
              ),
            );
          }
        ),
      )
    );
  }
}

class Recipe{
  String imageUrl;
  String label;

  Recipe(this.label,this.imageUrl);
  static List<Recipe> samples = [
    Recipe("Spagetti and Meatballs","https://img.freepik.com/free-photo/tasty-pepperoni-pizza-and-cooking-ingredients_79782-15.jpg?size=626&ext=jpg"),
    Recipe("Tomato soup","https://img.freepik.com/free-photo/tasty-pepperoni-pizza-and-cooking-ingredients_79782-15.jpg?size=626&ext=jpg"),
    Recipe("Grilled cheese","https://img.freepik.com/free-photo/tasty-pepperoni-pizza-and-cooking-ingredients_79782-15.jpg?size=626&ext=jpg"),
    Recipe("Chocolate Chip Cookies","https://img.freepik.com/free-photo/tasty-pepperoni-pizza-and-cooking-ingredients_79782-15.jpg?size=626&ext=jpg"),
    Recipe("Taco Salad","https://img.freepik.com/free-photo/tasty-pepperoni-pizza-and-cooking-ingredients_79782-15.jpg?size=626&ext=jpg"),
    Recipe("Hawaiian Pizza","https://img.freepik.com/free-photo/tasty-pepperoni-pizza-and-cooking-ingredients_79782-15.jpg?size=626&ext=jpg"),
  ];
}