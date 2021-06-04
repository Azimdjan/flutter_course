import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;

  FiltersScreen(this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;

  bool isLactoseFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () => widget.setFilters({
              'gluten': isGlutenFree,
              'lactose': isLactoseFree,
              'vegetarian': isVegetarian,
              'vegan': isVegan,
            }),
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.title,
            ),
            Expanded(
              child: Column(
                children: [
                  SwitchListTile(
                    value: isGlutenFree,
                    title: Text("Gluten-free"),
                    subtitle: Text("Only include gluten-free meals."),
                    onChanged: (value) {
                      setState(() {
                        isGlutenFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: isLactoseFree,
                    title: Text("Lactose-free"),
                    subtitle: Text("Only include lactose-free meals."),
                    onChanged: (value) {
                      setState(() {
                        isLactoseFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: isVegetarian,
                    title: Text("Vegetarian"),
                    subtitle: Text("Only include vegetarian meals."),
                    onChanged: (value) {
                      setState(() {
                        isVegetarian = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: isVegan,
                    title: Text("Vegan"),
                    subtitle: Text("Only include vegan meals."),
                    onChanged: (value) {
                      setState(() {
                        isVegan = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
