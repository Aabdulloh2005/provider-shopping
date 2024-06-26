import 'package:flutter/material.dart';
import 'package:lesson64/models/product.dart';

class ProductController {
  final List<Product> _products = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone 14",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4-hFYbCiOXhpJTSVD2XHWzSdKaBPfBUynJg&s",
      price: 999.99,
      description: "The latest iPhone with advanced features and sleek design.",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Samsung Galaxy S22",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9TWB5zh_a6Qejbp_qLBDpZnj8ra1WMMCrjw&s",
      price: 799.99,
      description: "A powerful Android phone with a stunning display and camera.",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Google Pixel 6",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhKpLknM_UHh7ej0CCKm-QyyctF424kuXn9w&s",
      price: 699.99,
      description: "Google's flagship phone with pure Android experience.",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "OnePlus 9 Pro",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4oOZYcw8I3Dewqin0zskDV85gFMUf1KVB4w&s",
      price: 969.99,
      description: "A high-end smartphone with fast performance and great design.",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "MacBook Pro",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5eSsXhM6e0JW-2S0ZH-ZSPFqN4PsWGNaK4g&s",
      price: 1299.99,
      description: "Apple's top-tier laptop with powerful performance and Retina display.",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Dell XPS 13",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSB-Gut3b4EMJojBB3XzusSyC8KMYLGHkuqw&s",
      price: 999.99,
      description: "A premium Windows laptop with a compact design and long battery life.",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "HP Spectre x360",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLfUzBFqQfz8JYXrJWvOW_nWZLWxDTgGHskQ&s",
      price: 1099.99,
      description: "A versatile 2-in-1 laptop with excellent build quality and performance.",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "iPad Pro",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKQt42u3F_IyRSAAXfGLWiS0XIotuZhHa2Nw&s",
      price: 799.99,
      description: "Apple's professional tablet with powerful hardware and large display.",
    ),
  ];

  List<Product> get list {
    return [..._products];
  }
}
