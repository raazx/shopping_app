import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/edit_product_screen.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/product_user_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routName = '/user-Products';
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Prodcuts>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProdutScreen.routName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const Appdrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (context, index) => ChangeNotifierProvider(
                  create: (context) => productData.items[index],
                  child: const ProductUserItem(),
                )),
      ),
    );
  }
}
