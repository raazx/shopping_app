import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart.dart';

class CartItems extends StatelessWidget {
  const CartItems({required this.cartItem, required this.onDismiss, super.key});
  final CartItem cartItem;
  final void Function(String id) onDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(cartItem.productId),
      confirmDismiss: (direction) {
        return showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content:
                      const Text('Do you want to remove the item from cart?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Yes')),
                  ],
                ));
      },
      onDismissed: (direction) {
        onDismiss(cartItem.productId);
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(right: 40),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
                child: FittedBox(child: Text('\$${cartItem.price}'))),
            title: Text(cartItem.title),
            subtitle: Text('Total: \$${cartItem.price * cartItem.quantity}'),
            trailing: Chip(label: Text('${cartItem.quantity} x')),
          ),
        ),
      ),
    );
  }
}
