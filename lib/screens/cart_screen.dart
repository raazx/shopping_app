import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routName = '/Cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartdata = Provider.of<Cart>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      drawer: const Appdrawer(),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Spacer(),
                Chip(
                  label: Text(" \$ ${cart.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                      Navigator.of(context).pushNamed(OrdersScreen.routName);
                    },
                    child: const Text('Order Now'))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(cart.items.length.toString()),
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, i) => CartItems(
              cartItem: cartdata.values.toList()[i],
              onDismiss: (id) => cart.removeItemfromCart(id),
            ),
          ),
        )
      ]),
    );
  }
}
