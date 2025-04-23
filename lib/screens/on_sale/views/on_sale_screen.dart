import 'package:flutter/material.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("On Sale")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SaleProductCard(
            imageUrl: "assets/images/product1.png",
            title: "Nike Running Shoes",
            oldPrice: "₹4,999",
            newPrice: "₹2,999",
            discount: "40% OFF",
          ),
          SaleProductCard(
            imageUrl: "assets/images/product2.png",
            title: "Adidas Hoodie",
            oldPrice: "₹3,499",
            newPrice: "₹1,999",
            discount: "45% OFF",
          ),
        ],
      ),
    );
  }
}

class SaleProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String oldPrice;
  final String newPrice;
  final String discount;

  const SaleProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Image.asset(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$oldPrice → $newPrice"),
        trailing: Text(discount, style: TextStyle(color: Colors.red)),
        onTap: () {
          // Navigate to product details page
        },
      ),
    );
  }
}
