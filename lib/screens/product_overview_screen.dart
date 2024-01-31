import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/widgets/product_item.dart';
import 'package:shopping_app/widgets/products_Gridview.dart';

enum FilterOption {
  favoriets,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  static const routeName = '/overview';

  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _onlyshowFavs = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Overview'),
          actions: [
            PopupMenuButton(
                onSelected: (FilterOption value) {
                  if (value == FilterOption.favoriets) {
                    setState(() {
                      _onlyshowFavs = true;
                    });
                  } else {
                    // ....
                    setState(() {
                      _onlyshowFavs = false;
                    });
                  }
                },
                itemBuilder: (ctx) => [
                      const PopupMenuItem(
                        value: FilterOption.favoriets,
                        child: Text('Only Favoriets'),
                      ),
                      const PopupMenuItem(
                        value: FilterOption.all,
                        child: Text('Show All'),
                      ),
                    ])
          ],
        ),
        body: ProductGridview(
          showitems: _onlyshowFavs,
        ));
  }
}
