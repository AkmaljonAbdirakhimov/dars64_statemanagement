import 'package:dars64_statemanagement/controllers/cart_controller.dart';
import 'package:dars64_statemanagement/controllers/products_controller.dart';
import 'package:dars64_statemanagement/models/product.dart';
import 'package:provider/provider.dart';

import '../views/screens/products_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return CartController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProductsController();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amber,
          ),
        ),
        home: ProductsScreen(),
      ),
    );
  }
}
