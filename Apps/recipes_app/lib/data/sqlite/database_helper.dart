import 'package:path/path.dart';
import '../model/ingredient.dart';
import '../model/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static const _databaseName = 'MyRecipes.db';
  static const _databaseVersion = 1;

  static const recipeTable = 'Recipe';
  static const ingredientTable = 'Ingredient';

  static BriteDatabase _streamDatabase;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static var lock = Lock();

  static Database _database;

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $recipeTable (
    _id INTEGER PRIMARY KEY,
    label TEXT,
    image TEXT,
    url TEXT,
    calories REAL,
    totalWeight REAL,
    totalTime REAL)''');

    await db.execute('''
    CREATE TABLE $ingredientTable (
    _ingredientId INTEGER PRIMARY KEY,
    recipeId INTEGER,
    name TEXT,
    weight REAL)''');
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    Sqflite.setDebugModeOn(true);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    await lock.synchronized(() async {
      if (_database == null) {
        _database = await _initDatabase();
        _streamDatabase = BriteDatabase(_database, true);
      }
    });
    return _database;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase;
  }

  List<Recipe> parseRecipes(List<Map<String, dynamic>> recipeList) {
    final recipes = <Recipe>[];
    recipeList.forEach((element) {
      final recipe = Recipe.fromJson(element);
      recipes.add(recipe);
    });
    return recipes;
  }

  List<Ingredient> parseIngredients(List<Map<String, dynamic>> ingredientList) {
    final ingredients = <Ingredient>[];
    ingredientList.forEach((element) {
      final ingredient = Ingredient.fromJson(element);
      ingredients.add(ingredient);
    });
    return ingredients;
  }

  Future<List<Recipe>> findAllRecipes() async {
    final db = await instance.streamDatabase;
    final recipeList = await db.query(recipeTable);
    final recipes = parseRecipes(recipeList);
    return recipes;
  }

  Stream<List<Recipe>> watchAllRecipes() async* {
    final db = await instance.streamDatabase;
    yield* db.createQuery(recipeTable).mapToList((row) => Recipe.fromJson(row));
  }

  Stream<List<Ingredient>> watchAllIngredients() async* {
    final db = await instance.streamDatabase;
    yield* db
        .createQuery(ingredientTable)
        .mapToList((row) => Ingredient.fromJson(row));
  }

  Future<Recipe> findRecipeById(int id) async {
    final db = await instance.streamDatabase;
    final recipeList = await db.query(recipeTable, where: '_id = $id');
    final recipes = parseRecipes(recipeList);
    return recipes.first;
  }

  Future<List<Ingredient>> findAllIngredients() async {
    final db = await instance.streamDatabase;
    final ingredientList = await db.query(ingredientTable);
    final ingredients = parseIngredients(ingredientList);
    return ingredients;
  }

  Future<List<Ingredient>> findRecipeIngredients(int recipeId) async {
    final db = await instance.streamDatabase;
    final ingredientList =
        await db.query(ingredientTable, where: 'recipeId=$recipeId');
    final ingredients = parseIngredients(ingredientList);
    return ingredients;
  }

  Future<int> insert(String tableName, Map<String, dynamic> row) async {
    final db = await instance.streamDatabase;
    return db.insert(tableName, row);
  }

  Future<int> insertRecipe(Recipe recipe) {
    return insert(recipeTable, recipe.toJson());
  }

  Future<int> insertIngredient(Ingredient ingredient) {
    return insert(ingredientTable, ingredient.toJson());
  }

  Future<int> _delete(String tableName, String columnId, int id) async {
    final db = await instance.streamDatabase;
    return db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteRecipe(Recipe recipe) async {
    return _delete(recipeTable, '_id', recipe.id);
  }

  Future<int> deleteIngredient(Ingredient ingredient) async {
    return _delete(ingredientTable, '_ingredientId', ingredient.id);
  }

  Future<void> deleteIngredients(List<Ingredient> ingredients) {
    if (ingredients != null) {
      ingredients.forEach((element) {
        if (element != null) deleteIngredient(element);
      });
    }
    return Future.value();
  }

  Future<int> deleteRecipeIngredient(int id) async {
    final db = await instance.streamDatabase;
    return db.delete(ingredientTable, where: 'recipeId = ?', whereArgs: [id]);
  }

  void close(){
    _streamDatabase.close();
  }
}
