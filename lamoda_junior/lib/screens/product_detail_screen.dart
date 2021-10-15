import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-details';
 
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(product.title),),
      body: Column(
        children: [
          Image.network(product.imageUrl,),
          Text(product.title),
          Text('Цена за товар ${product.price}'),
          Text('О товаре: ${product.description}'),
        ],
      ),
    );
  }
}
