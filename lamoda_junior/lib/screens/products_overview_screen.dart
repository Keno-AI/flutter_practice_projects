import 'package:flutter/material.dart';
import 'package:lamoda_junior/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// // import '../providers/products.dart';
// import '../data.dart';
import '../widgets/products_grid_view.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showFavourite = false;

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    // final products = productsData.items;

    return Scaffold(
        appBar: AppBar(
          
          title: Text('Men clothes'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      showFavourite = true;
                    } else {
                      showFavourite = false;
                    }
                    ;
                  });
                },
                icon: Icon(
                  Icons.more_vert,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text("Only Favorites"),
                        value: FilterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text("Show All"),
                        value: FilterOptions.All,
                      )
                    ]),
            Consumer<Cart>(
              builder: (_, cart, ch) =>
                  Badge(child: ch, value: cart.getLength().toString()),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                  )),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: ProductGridView(showFavourite));
  }
}
