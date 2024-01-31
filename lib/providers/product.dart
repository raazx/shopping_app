import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String description;
  final String images;
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.description,
    required this.images,
    this.isFavorite = false,
  });

  void toggleFavorietStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}


  // final DateTime dateTime;
  // final Function onSelectProduct;
  // final Function onRemoveFromCart;
  // final Function onAddToFavorites;
  // final Category category;
  // final Brand brand;
  // final Store store;
  // final User user;
  // final bool inStock;
  // final bool isVisible;
  // final bool showFavIcon;
  // final bool isLoading;
  // final num rating;
  // final int totalRating;
  // final int reviewCount;
  // final Color color;
  // final Size size;
  // final Status status;
  // final Gender gender;
  // final Type type;
  // final Map<String, dynamic> additionalData;
  // final Set<Attribute> attributes;
  // final bool isInWishList;
  // final CartItem cartItem;
