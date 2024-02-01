import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/products_grid.dart';

enum FilerOptions {
  favoriets,
  showAll,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorriets = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Myshop'), actions: <Widget>[
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          onSelected: (FilerOptions onselectedValue) {
            if (onselectedValue == FilerOptions.favoriets) {
              // show only filters items
              setState(() {
                _showOnlyFavorriets = true;
              });
            } else {
              setState(() {
                _showOnlyFavorriets = false;
              });
            }
          },
          onCanceled: () {
            // print('calnceled');
          },
          itemBuilder: (_) => [
            const PopupMenuItem(
              value: FilerOptions.favoriets,
              child: Text('only Faoriets'),
            ),
            const PopupMenuItem(
              value: FilerOptions.showAll,
              child: Text('show All'),
            ),
          ],
        ),
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
      ]),
      body: ProductsGrid(showFavoriets: _showOnlyFavorriets),
      drawer: const Appdrawer(),
    );
  }
}
