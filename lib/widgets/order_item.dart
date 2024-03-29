import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/providers/orders.dart';

class OrderItems extends StatefulWidget {
  const OrderItems({required this.order, super.key});
  final OrderItem order;

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(children: [
        ListTile(
          title: Text('\$ ${widget.order.amount.toStringAsFixed(2)}'),
          subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)),
          trailing: _expanded
              ? TextButton.icon(
                  label: const Text('Less'),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  icon: const Icon(Icons.expand_less))
              : TextButton.icon(
                  label: const Text('More'),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  icon:
                      Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
        ),
        if (_expanded) ...[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            height: min(widget.order.products.length * 20 + 10, 180),
            child: ListView(
              children: widget.order.products
                  .map((prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          )
        ]
      ]),
    );
  }
}
