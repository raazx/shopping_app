import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const rountName = '/product-details';
  const ProductDetailsScreen({super.key});
  // final Product product;
  // const ProductDetailsScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    final loadedproduct =
        Provider.of<Prodcuts>(context, listen: false).findByID(product.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(loadedproduct.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 300,
                child: Image.asset(
                  loadedproduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${loadedproduct.price}',
                style: const TextStyle(color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  loadedproduct.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(),
                  softWrap: true,
                ),
              )
            ],
          ),
        ));
  }
}
