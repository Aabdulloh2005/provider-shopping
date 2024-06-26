class Order {
  final String id;
  final Map<String, Map<String, dynamic>> products;
  final double totalPrice;

  Order({
    required this.id,
    required this.products,
    required this.totalPrice,
  });
}
