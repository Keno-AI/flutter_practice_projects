import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';

class ProductGridView extends StatelessWidget {
  // const ProductGridView({
  //   Key key,
  //   @required this.loadedProducts,
  // }) : super(key: key);

  // final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider(
          create: (c) => products[index],
          child: ProductItem())
    ,
      itemCount: products.length,
    );
  }
}
