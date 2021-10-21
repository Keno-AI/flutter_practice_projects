import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Total'),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(label: Text('${cart.totalAmount()}'))
                ],
              ),
            ),
          ),
          ElevatedButton(
            
            onPressed: () {
              Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount());
              cart.clear();
            },
            child: Text('Make an order'),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
