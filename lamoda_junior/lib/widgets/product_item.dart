import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lamoda_junior/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  // ProductItem(this.id, this.title, this.imageUrl, this.price);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      header: GridTileBar(
        title: SizedBox(width: 10,),
        leading:
            IconButton(onPressed: () {product.toggleFavorite();}, icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border_outlined),color:  Colors.redAccent,),
        //backgroundColor: Colors.black54,
        trailing: IconButton(
            onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined,color: Colors.blueGrey)), 
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
        backgroundColor: Colors.black54
      ),
    );
  }
}
