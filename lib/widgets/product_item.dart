import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final String productID;
  final String productTitle;

  final String productImageUrl;
  final String productDescriptin;
  final double price;

  const ProductItem({
    super.key,
    required this.productID,
    required this.productTitle,
    required this.productImageUrl,
    required this.price,
    required this.productDescriptin,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: const Icon(Icons.favorite),
          trailing: const Icon(Icons.shopping_cart),
          title: Text(
            productTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                arguments: {'id': productID});
          },
          child: Image.network(
            productImageUrl,
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
