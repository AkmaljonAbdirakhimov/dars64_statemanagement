import 'package:dars64_statemanagement/controllers/products_controller.dart';
import 'package:dars64_statemanagement/views/screens/cart_screen.dart';
import 'package:dars64_statemanagement/views/widgets/add_product_dialog.dart';
import 'package:dars64_statemanagement/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = context.watch<ProductsController>();
    // Provider.of<ProductsController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("D I N A M O"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider.value(
            value: product,
            child: ProductItem(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return AddProductDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
