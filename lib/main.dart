import 'package:flutter/material.dart';
import 'package:lesson64/controller/cart_controller.dart';
import 'package:lesson64/views/screens/products_screen.dart';
import 'package:lesson64/utils/apptheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: ProductsScreen(),
        );
      },
    );
  }
}
