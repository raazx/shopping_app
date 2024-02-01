import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import 'package:shopping_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routName = "/orders";
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      drawer: const Appdrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              elevation: 5,
              color: Colors.amber,
              child: Text(
                orderData.orders[index].id,
              ),
            ),
            OrderItems(order: orderData.orders[index]),
          ],
        ),
      ),
    );
  }
}
