import 'package:flutter/widgets.dart';

class CartItem {
  final String id;
  final String productId;
  final int quantity;
  final double price;
  final String title;

  CartItem(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.title,
      required this.productId});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  void addItem(
    String productId,
    String title,
    double price,
  ) {
    if (_items.containsKey(productId)) {
      // quantityadd
      _items.update(
          productId,
          (existngCartItem) => CartItem(
                id: existngCartItem.id,
                price: existngCartItem.price,
                productId: existngCartItem.productId,
                title: existngCartItem.title,
                quantity: existngCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              price: price,
              quantity: 1,
              title: title,
              productId: productId));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void removeItemfromCart(String prodId) {
    _items.removeWhere((key, value) => value.productId == prodId);
    notifyListeners();
  }

  void removeSingleItem(String prodId) {
    if (!_items.containsKey(prodId)) {
      return;
    }
    if (_items[prodId]!.quantity > 1) {
      // decrease the item by one and update it in map
      _items.update(
          prodId,
          (existngCartItem) => CartItem(
                id: existngCartItem.id,
                price: existngCartItem.price,
                productId: existngCartItem.productId,
                title: existngCartItem.title,
                quantity: existngCartItem.quantity - 1,
              ));
    } else {
      _items.remove(prodId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
