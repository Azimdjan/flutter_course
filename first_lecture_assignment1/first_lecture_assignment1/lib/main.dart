import 'package:flutter/material.dart';
import 'Recipe.dart';
import 'RecipeDetail.dart';

void main() {
  runApp(RecipeCalculatorApp());
}

class RecipeCalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator App',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.black,
        fontFamily: "Jomhuria",
      ),
      home: MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        style: TextStyle(fontSize: 50.0),),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context){
                       return RecipeDetail(Recipe.samples[index]);
                     }
                   ));
              },
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe){
    return Container(
      width: 339.0,
      height: 339.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3),
          )
        ]
      ),
      child:
      Padding(
          padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl),),
          SizedBox(
            height: 14.0,
          ),
          Text(
              recipe.label,
              style: TextStyle(
                fontSize: 40.0,
              ),),
        ],
      ),
      ),
    );
  }
}