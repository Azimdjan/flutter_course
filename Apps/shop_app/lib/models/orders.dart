import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shop_app/models/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return _orders;
  }

  Future<void> fetchAndSetOrders() async {
    var url = Uri.parse(
        'https://flutter-app-3eded-default-rtdb.firebaseio.com/orders.json');
    final response = await http.get(url);
    final responseBody = json.decode(response.body) as Map<String, dynamic>;
    if(responseBody == null)
      return;
    List<OrderItem> currentOrders = [];
    responseBody.forEach((orderId, orderData) {
      currentOrders.add(OrderItem(
        id: orderId,
        amount: orderData['totalAmount'],
        products: (orderData['products'] as List<dynamic>).map((element) {
          return CartItem(
              id: element['id'],
              title: element['title'],
              price: element['price'],
              quantity: element['quantity']);
        }).toList(),
        dateTime: orderData['dateTime'],
      ));
    });
    _orders = currentOrders;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    var url = Uri.parse(
        'https://flutter-app-3eded-default-rtdb.firebaseio.com/orders.json');
    final timeStamp = DateTime.now();
    final response = await http.post(url,
        body: json.encode({
          'totalAmount': total,
          'dateTime': timeStamp.toIso8601String(),
          'products': cartProducts
              .map((product) => {
                    'id': product.id,
                    'title': product.title,
                    'price': product.price,
                    'quantity': product.quantity,
                  })
              .toList(),
        }));
    _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          products: cartProducts,
          dateTime: timeStamp,
        ));
    notifyListeners();
  }

  void removeOrder(String id) {
    _orders.remove(id);
    notifyListeners();
  }
}
