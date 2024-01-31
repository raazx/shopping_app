import 'package:flutter/material.dart';

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  productImageUrl,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 60,
                bottom: 10,
                child: Text(productTitle),
              )
            ],
          )
        ],
      ),
    );
  }
}
