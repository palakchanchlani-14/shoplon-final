import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          OrderCard(
            orderId: "12345",
            status: "Delivered",
            date: "20 Feb 2025",
            amount: "₹1,299",
          ),
          OrderCard(
            orderId: "67890",
            status: "Cancelled",
            date: "18 Feb 2025",
            amount: "₹799",
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String status;
  final String date;
  final String amount;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.status,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text("Order ID: $orderId"),
        subtitle: Text("Status: $status\nDate: $date"),
        trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {
          // Navigate to order details page
        },
      ),
    );
  }
}
