import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _products = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  Product getProductById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }

  List<Product> get favoriteProducts {
    return _products.where((element) => element.isFavourite).toList();
  }

  List<Product> get products {
    return _products;
  }

  void deleteProduct(String id) {
    _products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> updateProduct(String id, Product product) async {
    var url = Uri.parse(
        'https://flutter-app-3eded-default-rtdb.firebaseio.com/products/$id.json');
    await http.patch(url,body: json.encode({
      'title':product.title,
      'description':product.description,
      'price':product.price,
      'imageUrl':product.imageUrl,
    }));
    final index = _products.indexWhere((element) => element.id == id);
    _products[index] = product;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    try {
      var url = Uri.parse(
          'https://flutter-app-3eded-default-rtdb.firebaseio.com/products.json');
      final response = await http.get(url);
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      List<Product> loadedProducts = [];
      responseBody.forEach((productId, productData) {
        loadedProducts.insert(0,
            Product(
              id: productId,
              title: productData['title'],
              description: productData['description'],
              imageUrl: productData['imageUrl'],
              price: productData['price'],
              isFavourite: productData['isFavorite'],
            ));
      });
      _products = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      var url = Uri.parse(
          'https://flutter-app-3eded-default-rtdb.firebaseio.com/products.json');
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'isFavorite': product.isFavourite,
        }),
      );
      final tempProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _products.insert(0, tempProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
