import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  const CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _carts = {};

  Map<String, CartItem> get carts {
    return _carts;
  }

  int get numberOfCarts {
    return _carts.length;
  }

  double get total {
    var total = 0.0;
    _carts.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  void addItems({
    required String id,
    required double price,
    required String title,
  }) {
    if (_carts.containsKey(id)) {
      _carts.update(
        id,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            price: value.price,
            quantity: value.quantity + 1),
      );
    } else {
      _carts.putIfAbsent(
        id,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeCart(String productID) {
    _carts.remove(productID);
    notifyListeners();
  }

  void undoAction(String productId) {
    if (!_carts.containsKey(productId)) {
      return;
    }
    if (_carts[productId]!.quantity > 1) {
      _carts.update(
        productId,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            price: value.price,
            quantity: value.quantity - 1),
      );
    }
    else{
      _carts.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _carts = {};
    notifyListeners();
  }
}
