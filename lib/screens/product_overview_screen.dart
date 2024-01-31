import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/screens/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({super.key});
  final List<Product> loadedProduct = [
    Product(
      id: 'p1',
      title: 'red shirt',
      price: 29.99,
      quantity: 11,
      description: 'A red shirt - it is pretty red!',
      images:
          'https://img.freepik.com/premium-photo/close-up-red-shirt-grey-surface-generative-ai_899894-55578.jpg',
    ),
    Product(
      id: 'p2',
      title: 'grey pants',
      price: 29.99,
      quantity: 8,
      description: 'A grey pants - it is pretty grey!',
      images:
          'https://www.mont.com.au/cdn/shop/products/adventure-light-pant-driftwood_2000x.jpg?v=1664408010',
    ),
    Product(
      id: 'p3',
      title: 'Scarf',
      price: 20.00,
      quantity: 7,
      description: 'Mille et Un Lapins scarf 90 | Hermès Hong Kong SAR 20',
      images:
          'https://assets.hermes.com/is/image/hermesproduct/mille-et-un-lapins-scarf-90--004007S%2004-worn-3-0-0-800-800_g.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Overview')),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        itemCount: loadedProduct.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext ctxt, int index) => ProductItem(
          productImageUrl: loadedProduct[index].images,
          price: loadedProduct[index].price,
          productDescriptin: loadedProduct[index].description,
          productID: loadedProduct[index].id,
          productTitle: loadedProduct[index].title,
        ),
      ),
    );
  }
}