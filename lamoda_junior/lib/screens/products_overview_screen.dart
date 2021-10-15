import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// // import '../providers/products.dart';
// import '../data.dart';
import '../widgets/products_grid_view.dart';


class ProductsOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    // final products = productsData.items;
    return Scaffold(
      appBar: AppBar(title: Text('Men clothes'),backgroundColor: Theme.of(context).primaryColor,),
      body: ProductGridView());
  }
}

