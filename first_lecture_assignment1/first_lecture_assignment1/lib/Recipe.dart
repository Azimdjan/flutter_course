class Recipe{
  final String imageUrl;
  final String label;
  final int servings;
  final List<Ingredients> ingredients;
  Recipe(this.label,this.imageUrl,this.servings,this.ingredients);

  static List<Recipe> samples = [
      Recipe("Osh", "assets/osh.jpg",4,
      [Ingredients(1, "kilogram", "guruch"),
      Ingredients(200, "gram", "sabzi"),
      Ingredients(250, "gram", "piyoz"),
      Ingredients(50, "gram", "nohot")]),
    Recipe("Shashlik", "assets/shashlik.jpg",4,
        [Ingredients(1, "kilogram", "go'sht"),
          Ingredients(250, "gram", "piyoz"),
          Ingredients(1, "ta", "qo'ra")]),
    Recipe("Chuchvara", "assets/chuchvara.jpg",4,
        [Ingredients(1, "kilogram", "guruch"),
          Ingredients(200, "gram", "sabzi"),
          Ingredients(250, "gram", "piyoz"),
          Ingredients(50, "gram", "nohot")]),
    Recipe("Manti", "assets/manti.jpg",4,
        [Ingredients(1, "kilogram", "guruch"),
          Ingredients(200, "gram", "sabzi"),
          Ingredients(250, "gram", "piyoz"),
          Ingredients(50, "gram", "nohot")]),
    Recipe("Shorva", "assets/shorva.jpg",2,
        [Ingredients(1, "kilogram", "guruch"),
          Ingredients(200, "gram", "sabzi"),
          Ingredients(250, "gram", "piyoz"),
          Ingredients(50, "gram", "nohot")]),
    Recipe("Honim", "assets/honim.jpg",3,
        [Ingredients(1, "kilogram", "guruch"),
          Ingredients(200, "gram", "sabzi"),
          Ingredients(250, "gram", "piyoz"),
          Ingredients(50, "gram", "nohot")]),
  ];
}

class Ingredients{
  final double quantity;
  final String measure;
  final String name;

  Ingredients(this.quantity,this.measure,this.name);
}