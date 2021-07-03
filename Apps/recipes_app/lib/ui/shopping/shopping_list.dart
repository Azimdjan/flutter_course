import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repository.dart';


class ShoppingList extends StatelessWidget {
  const ShoppingList({Key key}) : super(key: key);

  // TODO 1
  //final ingredients = <String>[];

  @override
  Widget build(BuildContext context) {
    // TODO 2
    final repository = Provider.of<Repository>(context);
    print('hello i am here');
    return StreamBuilder(
        stream: repository.watchAllIngredients(),
        builder: (ctx,snapshot){
      if(snapshot.connectionState == ConnectionState.active) {
        final ingredients = snapshot.data;
        print('hello there');
        if(ingredients==null)
          return Container();
        return ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                value: false,
                // TODO 3
                title: Text(ingredients[index].name),
                onChanged: (newValue) {},
              );
            });
      }
      else{
        print('i am in else');
        return Container();
      }
    });
  }
}
