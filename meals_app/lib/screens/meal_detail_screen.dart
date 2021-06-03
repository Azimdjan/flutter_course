import 'package:flutter/material.dart';
import 'package:meals_app/repo/3.2%20dummy_data.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                selectedMeal.imageUrl,
                width: double.infinity,
                height: mediaQuery.size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                width: mediaQuery.size.width * 0.7,
                height: mediaQuery.size.height * 0.25,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                width: mediaQuery.size.width * 0.7,
                height: mediaQuery.size.height * 0.25,
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text("# ${index + 1}",style: TextStyle(color: Colors.white),),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ],
          ),
        ));
  }
}
