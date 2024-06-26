import 'package:flutter/material.dart';
import 'package:lesson64/controller/cart_controller.dart';
import 'package:lesson64/controller/product_controller.dart';
import 'package:lesson64/models/product.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final productsController = ProductController();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.network(
              product.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  " ---    \$${product.price}",
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<CartController>(
        builder: (context, controller, child) {
          return controller.isInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.purple),
                      onPressed: () {
                        controller.removeFromCart(product.id);
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        controller.getProductAmount(product.id).toString(),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    IconButton(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.purple),
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.purple),
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
