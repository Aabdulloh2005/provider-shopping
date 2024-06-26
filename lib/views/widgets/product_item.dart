import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson64/controller/cart_controller.dart';
import 'package:lesson64/models/product.dart';
import 'package:lesson64/views/screens/detail_product_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: product,
              builder: (context, child) => const DetailProductScreen(),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 200,
            width: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$${product.price}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Consumer<CartController>(
            builder: (context, controller, child) {
              return controller.isInCart(product.id)
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
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
                  : IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                    );
            },
          )
        ],
      ),
    );
  }
}
