import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson64/controller/product_controller.dart';
import 'package:lesson64/models/product.dart';
import 'package:lesson64/views/screens/cart_screen.dart';
import 'package:lesson64/views/screens/orders_screen.dart';
import 'package:lesson64/views/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final productsController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) {
                    return const OrdersScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.credit_card_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          mainAxisExtent: 300,
          mainAxisSpacing: 20,
        ),
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return const ProductItem();
            },
          );
        },
      ),
    );
  }
}
