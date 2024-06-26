import 'package:flutter/material.dart';
import 'package:lesson64/controller/cart_controller.dart';
import 'package:lesson64/models/product.dart';
import 'package:lesson64/views/widgets/product_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Savatcha"),
      ),
      body: cartController.cart.products.isEmpty
          ? const Center(
              child: Text("Savatcha bo'sh, mahsulot qo'shing"),
            )
          : ListView.builder(
              itemCount: cartController.cart.products.length,
              itemBuilder: (ctx, index) {
                final product = cartController.cart.products.values
                    .toList()[index]['product'];
                return ChangeNotifierProvider<Product>.value(
                  value: product,
                  builder: (context, child) {
                    return const ProductItem();
                  },
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${cartController.cart.totalPrice}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          FilledButton(
            onPressed: () {
              cartController.placeOrder();
            },
            child: const Text("Buyurtma qilish"),
          ),
        ],
      ),
    );
  }
}
