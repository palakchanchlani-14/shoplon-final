import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    String title = product['title'];
    double price = product['price'];

    int index = _cartItems.indexWhere((item) => item['title'] == title);

    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
      print('Updated Quantity: ${_cartItems[index]}');
    } else {
      _cartItems.add({'title': title, 'price': price, 'quantity': 1});
      print('Added New Item: ${_cartItems.last}');
    }

    print('Cart Updated: $_cartItems');
    notifyListeners();
  }

  void increaseQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index]['quantity']++;
      print('Increased Quantity: ${_cartItems[index]}');
      notifyListeners();
    }
  }

  void decreaseQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      if (_cartItems[index]['quantity'] > 1) {
        _cartItems[index]['quantity']--;
        print('Decreased Quantity: ${_cartItems[index]}');
      } else {
        removeFromCart(index);
      }
      notifyListeners();
    }
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      print('Removed Item: ${_cartItems[index]}');
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    print('Cart Cleared');
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
      0,
          (sum, item) => sum + (item['price'] as double) * (item['quantity'] as int),
    );
  }
}
