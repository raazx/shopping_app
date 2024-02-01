import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.toggleFavorietStatus();
                },
                icon: Icon(
                  value.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.redAccent,
                )),
          ),
          trailing: IconButton(
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
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailsScreen.rountName, arguments: product);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
