import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoplon/components/cart_button.dart';
import 'package:shoplon/components/custom_modal_bottom_sheet.dart';
import 'package:shoplon/components/product/product_card.dart';
import 'package:shoplon/constants.dart';
import 'package:shoplon/screens/cart/cart_screen.dart'; // Import the CartScreen
import 'package:provider/provider.dart'; // Import provider
import 'package:shoplon/screens/product/views/product_returns_screen.dart';
import 'components/notify_me_card.dart';
import 'components/product_images.dart';
import 'components/product_info.dart';
import 'components/product_list_tile.dart';
import '../../../components/review_card.dart';
import 'product_buy_now_screen.dart';
import 'package:shoplon/screens/cart/cart_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, this.isProductAvailable = true});
  final bool isProductAvailable;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  void addToCart(Map<String, dynamic> product) {  // 👈 Accepts Map format
    Provider.of<CartProvider>(context, listen: false).addToCart(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product['title']} added to cart!")),
    );


    // ✅ Direct Cart Screen pe navigate karega
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        CartButton(
        price: 140,
        title: "Buy Now",
        press: () {
      customModalBottomSheet(
        context,
        height: MediaQuery.of(context).size.height * 0.92,
        child: const ProductBuyNowScreen(),
      );
    },
    ),
    SizedBox(height: 10), // Adds spacing between buttons
          CartButton(
            price: 140,
            title: "Add to Cart",
            press: () {
              addToCart({
                'title': "Sleeveless Ruffle",
                'price': 140,
              }); // ✅ Correct Map format me pass ho raha hai
            },
          ),

        ],
    ),
    body: SafeArea(
    child: CustomScrollView(
    slivers: [
    SliverAppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    floating: true,
    actions: [
    Stack(
    children: [
    IconButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CartScreen()), // Navigate to CartScreen
    );
    },
    icon: SvgPicture.asset(
    "assets/icons/Bookmark.svg",
    color: Theme.of(context).textTheme.bodyLarge!.color,
    ),
    ),
    if (Provider.of<CartProvider>(context).cartItems.isNotEmpty)
    Positioned(
    right: 8,
    top: 8,
    child: Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle,
    ),
    child: Text(
    "${Provider.of<CartProvider>(context).cartItems.length}",
    style: TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    const ProductImages(
    images: [productDemoImg1, productDemoImg2, productDemoImg3],
    ),
    ProductInfo(
    brand: "LIPSY LONDON",
    title: "Sleeveless Ruffle",
    isAvailable: widget.isProductAvailable,
    description:
    "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    rating: 4.4,
    numOfReviews: 126,
    ),
      ProductListTile(
        svgSrc: "assets/icons/Product.svg",
        title: "Product Details",
        press: () {
          customModalBottomSheet(
            context,
            height: MediaQuery.of(context).size.height * 0.92,
            child: const Center(child: Text("Product Details UI Here")),
          );
        },
      ),
      ProductListTile(
        svgSrc: "assets/icons/Delivery.svg",
        title: "Shipping Information",
        press: () {
          customModalBottomSheet(
            context,
            height: MediaQuery.of(context).size.height * 0.92,
            child: const Center(child: Text("Shipping Info UI Here")),
          );
        },
      ),
      ProductListTile(
        svgSrc: "assets/icons/Return.svg",
        title: "Returns",
        isShowBottomBorder: true,
        press: () {
          customModalBottomSheet(
            context,
            height: MediaQuery.of(context).size.height * 0.92,
            child: const ProductReturnsScreen(),
          );
        },
      ),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: ReviewCard(
            rating: 4.3,
            numOfReviews: 128,
            numOfFiveStar: 80,
            numOfFourStar: 30,
            numOfThreeStar: 5,
            numOfTwoStar: 4,
            numOfOneStar: 1,
          ),
        ),
      ),
      ProductListTile(
        svgSrc: "assets/icons/Chat.svg",
        title: "Reviews",
        isShowBottomBorder: true,
        press: () {
          Navigator.pushNamed(context, "/productReviewsScreen");
        },
      ),
      SliverPadding(
        padding: const EdgeInsets.all(defaultPadding),
        sliver: SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cart Items",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Provider.of<CartProvider>(context).cartItems.isEmpty
                  ? Text("Your cart is empty.")
                  : Column(
                children: Provider.of<CartProvider>(context)
                    .cartItems
                    .map((item) {
                  return ListTile(
                    title: Text(item['title']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Implement remove from cart logic here
                        int index = Provider.of<CartProvider>(context, listen: false).cartItems.indexOf(item);
                        Provider.of<CartProvider>(context, listen: false).removeFromCart(index);
                      },
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                "You may also like",
                style: Theme.of(context).textTheme.titleSmall!,
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Number of products to display
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == 4 ? defaultPadding : 0,
              ),
              child: ProductCard(
                image: productDemoImg2, // Replace with actual image
                title: "Sleeveless Tiered Dobby Swing Dress",
                brandName: "LIPSY LONDON",
                price: 24.65,
                priceAfetDiscount: index.isEven ? 20.99 : null,
                dicountpercent: index.isEven ? 25 : null,
                press: () {
                  // Implement the action when the product card is pressed
                  // You can navigate to the product details screen or add to cart
                },
              ),
            ),
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: SizedBox(height: defaultPadding),
      ),
    ],
    ),
    ),
    );
  }
}