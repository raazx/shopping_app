import 'package:flutter/material.dart';
import 'package:shopping_app/providers/product.dart';

class Prodcuts with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'red shirt',
      price: 29.99,
      description: 'A red shirt - it is pretty red!',
      imageUrl:
          'https://img.freepik.com/premium-photo/close-up-red-shirt-grey-surface-generative-ai_899894-55578.jpg',
    ),
    Product(
      id: 'p2',
      title: 'grey pants',
      price: 29.99,
      description: 'A grey pants - it is pretty grey!',
      imageUrl:
          'https://www.mont.com.au/cdn/shop/products/adventure-light-pant-driftwood_2000x.jpg?v=1664408010',
    ),
    Product(
      id: 'p3',
      title: 'Scarf',
      price: 20.00,
      description: 'Mille et Un Lapins scarf 90 | Hermès Hong Kong SAR 20',
      imageUrl:
          'https://assets.hermes.com/is/image/hermesproduct/mille-et-un-lapins-scarf-90--004007S%2004-worn-3-0-0-800-800_g.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Tefal',
      price: 262.60,
      description: 'Tefal One-Pick-Pot Pan (Beige) | TEFAL',
      imageUrl:
          'https://www.theindusvalley.in/cdn/shop/files/fryingpanstainlesssteel_47304149-9609-410c-b4b6-d1ea2b0f5577.webp?v=1702106199',
    ),
    Product(
      id: 'p5',
      title: "Voodoo",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
      price: 49.99,
      imageUrl:
          "https://shop.amilaholdings.com/image/cache/data/Cosmatics/70-500x500.JPG",
    ),
    Product(
      id: 'p6',
      title: "Best Shoe Stores in San Diego",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
      price: 15,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV93_dW3a5DCy9FuN3dn44YrubouRo06So8A&usqp=CAU",
    ),
    Product(
      id: 'p7',
      title: "Wedding Bands ",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
      price: 49.99,
      imageUrl:
          "https://one2threejewelry.com/cdn/shop/files/WeddingBandwithMoissanite_800x.jpg?v=1699004433",
    ),
    Product(
      id: 'p8',
      title: " Strawberries",
      description:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
      price: 49.99,
      imageUrl:
          "https://www.melissas.com/cdn/shop/products/image-of-strawberries-fruit-14764295127084_600x600.jpg?v=1616979635",
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

  void addProduct(Product product) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
    _items.add(newProduct);
    print(product.id);
    notifyListeners();
  }

  void updateProduct(Product newProduct) {
    final productIndex = _items.indexWhere((prod) => prod.id == newProduct.id);
    _items[productIndex] = newProduct;
    notifyListeners();
  }
}
