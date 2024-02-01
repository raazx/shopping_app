import 'package:flutter/material.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/screens/user_product_screen.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello friend'),
            automaticallyImplyLeading: false,
          ),
          DrawerHeader(
            child: const Text('Hello friend'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('add product'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
