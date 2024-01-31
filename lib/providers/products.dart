import 'package:flutter/material.dart';
import 'package:shopping_app/providers/product.dart';

class Prodcuts with ChangeNotifier {
  final List<Product> _items = [
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
    Product(
      id: 'p4',
      title: 'Tefal',
      price: 262.60,
      quantity: 7,
      description: 'Tefal One-Pick-Pot Pan (Beige) | TEFAL',
      images:
          'https://www.theindusvalley.in/cdn/shop/files/fryingpanstainlesssteel_47304149-9609-410c-b4b6-d1ea2b0f5577.webp?v=1702106199',
    ),
  ];

  bool showOnlyFavoriets = false;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get fasItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  void showFasOnly(bool isfavoriet) {
    showOnlyFavoriets = isfavoriet;
    notifyListeners();
  }

  Product findByID(prodId) {
    return _items.firstWhere((prod) => prod.id == prodId);
  }

  void addProduct() {
    // _items.add();
    notifyListeners();
  }
}
