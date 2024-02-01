import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    required this.showFavoriets,
    super.key,
  });
  final bool showFavoriets;

  @override
  Widget build(BuildContext context) {
    final loadedProduct = showFavoriets
        ? Provider.of<Prodcuts>(context).fasItems
        : Provider.of<Prodcuts>(context).items;
    return GridView.builder(
      itemCount: loadedProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: loadedProduct[index],
        child: const ProductItem(),
      ),
    );
  }
}
