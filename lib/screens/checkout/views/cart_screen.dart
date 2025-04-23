import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {"title": "Cart Item 1", "image": "assets/screens/Cart_1.png", "quantity": 1},
    {"title": "Cart Item 2", "image": "assets/screens/Cart_2.png", "quantity": 1},
    {"title": "Cart Item 3", "image": "assets/screens/Cart_3.png", "quantity": 1},
    {"title": "Cart Item 4", "image": "assets/screens/Cart_4.png", "quantity": 1},
    {"title": "Cart Item 5", "image": "assets/screens/Cart_5.png", "quantity": 1},
    {"title": "Cart Item 6", "image": "assets/screens/Cart_6.png", "quantity": 1},
  ];

  void _updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] += change;
      if (cartItems[index]['quantity'] < 1) {
        cartItems.removeAt(index);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty!"))
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.asset(cartItems[index]['image'],
                  width: 50, height: 50, fit: BoxFit.cover),
              title: Text(cartItems[index]['title']),
              subtitle:
              Text("Quantity: ${cartItems[index]['quantity']}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.red),
                    onPressed: () => _updateQuantity(index, -1),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: () => _updateQuantity(index, 1),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeItem(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}