import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/widgets/product_item.dart';

class ProductGridview extends StatelessWidget {
  const ProductGridview({super.key, required this.showitems});
  final bool showitems;
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Prodcuts>(context);
    final products = showitems ? providerData.items : providerData.fasItems;
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (BuildContext ctxt, int index) =>
          ChangeNotifierProvider.value(
        value:
            products[index], // pass the product to the change notifier provider
        // value: (_) => products[index],
        // We need to use the `ChangeNotifierProxyProvider` in order to update our widget whenever a new value is added or removed from the list of products.
        // We use the `ChangeNotifierProxyProvider` to automatically update
        // the `ProductItem` widget whenever a new value is added to the list of products
        builder: (ctxt, snapshot) => ProductItem(),
      ),
    );
  }
}
