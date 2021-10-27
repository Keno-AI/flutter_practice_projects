import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lamoda_junior/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  // ProductItem(this.id, this.title, this.imageUrl, this.price);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      header: GridTileBar(
        title: SizedBox(
          width: 10,
        ),
        leading: Consumer<Product>(
          builder: (ctx, product, _) => IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: product.isFavourite
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.blueGrey,
                  ),
          ),
        ),
        //backgroundColor: Colors.black54,
        trailing: IconButton(
          onPressed: () {
            cart.addItem(product.id, product.title, product.price);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Item was added to cart'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(label: "UNDO", onPressed: () {
                  cart.removeItem(product.id);
                })));
          },
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.blueGrey),
        ),
      ),
      footer: GridTileBar(
          title: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(3),
                  child: Text('${product.price} ' +
                      NumberFormat.simpleCurrency(locale: 'kk_KZ')
                          .currencySymbol)),
              Container(padding: EdgeInsets.all(3), child: Text(product.title)),
            ],
          ),
          backgroundColor: Colors.black54),
    );
  }
}
