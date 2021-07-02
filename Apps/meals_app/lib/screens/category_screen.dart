import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../repo/3.2 dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: mediaQuery.size.width * 0.5,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: mediaQuery.size.height * 0.02,
        crossAxisSpacing: mediaQuery.size.width * 0.05,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
    );
  }
}
