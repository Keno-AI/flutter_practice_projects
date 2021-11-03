import 'package:flutter/material.dart';
import 'package:lamoda_junior/screens/edit_product_screen.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String productId;
  final String productImageUrl;
  final String productName;

  UserProductItem(this.productImageUrl, this.productName, this.productId);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(productImageUrl),),
      title: Text(productName),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: productId); 
            }, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {
              Provider.of<Products>(context,listen: false).deleteProduct(productId);
            }, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
