import 'dart:math';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<int> discounts = [10, 20, 30, 50, 5, 15, 25, 40];
  int? revealedDiscount;

  void revealDiscount() {
    setState(() {
      revealedDiscount = discounts[Random().nextInt(discounts.length)];
    });
  }

  void proceedToPayment() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Payment"),
        content: Text("Do you want to proceed with payment?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to actual payment gateway screen
            },
            child: Text("Pay Now"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scratch to reveal your discount!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            GestureDetector(
              onTap: revealDiscount,
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: revealedDiscount == null ? Colors.grey : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                alignment: Alignment.center,
                child: Text(
                  revealedDiscount == null ? "Scratch Here" : "$revealedDiscount% OFF!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Proceed to Pay Button
            ElevatedButton(
              onPressed: proceedToPayment,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text("Proceed to Pay"),
            ),
          ],
        ),
      ),
    );
  }
}
