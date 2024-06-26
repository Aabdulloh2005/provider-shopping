import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lesson64/controller/cart_controller.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<CartController>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text("No orders placed yet."),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (ctx, index) {
                final order = orders[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ...order.products.values.map((item) {
                          return Text(
                            "${item['amount']} x ${item['product'].title} - \$${item['product'].price}",
                          );
                        }).toList(),
                        const Divider(),
                        Text(
                          "Total: \$${order.totalPrice}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
