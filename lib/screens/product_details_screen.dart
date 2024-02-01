import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const rountName = '/product-details';
  const ProductDetailsScreen({super.key});
  // final Product product;
  // const ProductDetailsScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context, listen: false);

    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    final loadedproduct =
        Provider.of<Prodcuts>(context, listen: false).findByID(product.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.title),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) => IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routName);
              },
              icon: Badge(
                isLabelVisible: true,
                label: Text(
                  value.itemsCount.toString(),
                ),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 300,
              child: Image.network(
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
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
                label: const Text('Add to Cart'),
                onPressed: () {
                  cart.addItem(product.id, product.title, product.price);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Item added to the cart'),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        },
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.amberAccent,
                )),
          ],
        ),
      ),
      floatingActionButton: cart.itemsCount > 0
          ? FloatingActionButton.extended(
              backgroundColor: Colors.yellow,
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text('Go SHopping Cart'),
              onPressed: () {})
          : null,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
