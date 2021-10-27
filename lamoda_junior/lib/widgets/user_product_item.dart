import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String productImageUrl;
  final String productName;

  UserProductItem(this.productImageUrl, this.productName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(productImageUrl),),
      title: Text(productName),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
