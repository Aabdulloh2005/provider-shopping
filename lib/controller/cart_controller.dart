import 'package:flutter/material.dart';
import 'package:lesson64/models/cart.dart';
import 'package:lesson64/models/product.dart';
import 'package:lesson64/models/order.dart';

class CartController extends ChangeNotifier {
  final Cart _cart = Cart(
    products: {},
    totalPrice: 0,
  );

  final List<Order> _orders = [];

  Cart get cart {
    return _cart;
  }

  List<Order> get orders {
    return _orders;
  }

  void addToCart(Product product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }
    calculateTotal();
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.products.containsKey(productId)) {
      if (_cart.products[productId]["amount"] == 1) {
        _cart.products.removeWhere((key, value) {
          return key == productId;
        });
      } else {
        _cart.products[productId]["amount"]--;
      }
      calculateTotal();
      notifyListeners();
    }
  }

  void calculateTotal() {
    double total = 0;
    _cart.products.forEach((key, value) {
      total += value['product'].price * value['amount'];
    });
    _cart.totalPrice = total;
  }

  bool isInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]['amount'];
  }

  void placeOrder() {
    if (_cart.products.isEmpty) {
      return;
    }

    _orders.add(Order(
      id: UniqueKey().toString(),
      products: {..._cart.products},
      totalPrice: _cart.totalPrice,
    ));

    _cart.products.clear();
    _cart.totalPrice = 0;
    notifyListeners();
  }
}
