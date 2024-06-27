import 'dart:math';

import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone 15",
      price: 990,
      color: Colors.blue,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Samsung Galaxy XP 2",
      price: 920,
      color: Colors.teal,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Tesla Model Y",
      price: 35990,
      color: Colors.grey,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Macbook Pro",
      price: 1225.5,
      color: Colors.red,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(String title, double price) {
    String id = UniqueKey().toString();
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);
    Color color = Color.fromRGBO(red, green, blue, 1);

    _list.add(
      Product(
        id: id,
        title: title,
        price: price,
        color: color,
      ),
    );

    notifyListeners();
  }

  void editProduct(
    String productId,
    String newTitle,
    double newPrice,
  ) {
    int currentIndex = _list.indexWhere((product) {
      return product.id == productId;
    });

    if (currentIndex >= 0) {
      _list[currentIndex].title = newTitle;
      _list[currentIndex].price = newPrice;

      notifyListeners();
    }
  }

  void deleteProduct(String productId) {
    _list.removeWhere((product) {
      return product.id == productId;
    });

    notifyListeners();
  }
}
