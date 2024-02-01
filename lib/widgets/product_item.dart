import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  // final Product product;

  const ProductItem({
    super.key,
    // required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.toggleFavorietStatus();
                },
                icon: product.isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )),
          ),
          trailing: Consumer<Cart>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.addItem(product.id, product.title, product.price);
                },
                icon: product.isFavorite
                    ? const Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}


// Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       elevation: 5,
//       margin: EdgeInsets.all(5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//                 child: Image.network(
//                   productImageUrl,
//                   width: double.infinity,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 30,
//                 child: Container(
//                   width: 300,
//                   height: 50,
//                   margin: const EdgeInsets.all(2),
//                   color: Colors.black54,
//                   alignment: Alignment.center,
//                   child: Text(
//                     productDescriptin,
//                     softWrap: true,
//                     overflow: TextOverflow.fade,
//                     style: const TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
