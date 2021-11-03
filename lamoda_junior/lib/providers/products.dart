import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> data = [
    Product(
        id: 'id1',
        title: 'Брюки спортивные',
        description: 'Спортивные брюки от бренда GAP',
        price: 17400,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffDdMW2wApGY1U8IxYoFoE9W8zKHBJeAd_g&usqp=CAU'),
    Product(
        id: 'id2',
        title: 'Джемпер',
        description: 'Состав: Шерсть - 80%, Полиамид - 20%',
        price: 39010,
        imageUrl: 'https://cutur.ru/wp-content/uploads/_pu/17/75530845.jpg'),
    Product(
        id: 'id3',
        title: 'Футболка',
        description: 'Состав: Хлопок - 100%',
        price: 10400,
        imageUrl:
            'https://vdudvdud.ru/wa-data/public/shop/products/70/00/70/images/956/956.970.jpg'),
    Product(
        id: 'id4',
        title: 'Куртка джинсовая',
        description: 'Куртка джинсовая TRUCKER',
        price: 55100,
        imageUrl:
            'https://i.pinimg.com/originals/00/c1/6c/00c16c0f0ae837f49b78d4aa4a29ad74.jpg'),
    Product(
        id: 'id1',
        title: 'Брюки спортивные',
        description: 'Спортивные брюки от бренда GAP',
        price: 17400,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffDdMW2wApGY1U8IxYoFoE9W8zKHBJeAd_g&usqp=CAU'),
    Product(
        id: 'id2',
        title: 'Джемпер',
        description: 'Состав: Шерсть - 80%, Полиамид - 20%',
        price: 39010,
        imageUrl: 'https://cutur.ru/wp-content/uploads/_pu/17/75530845.jpg'),
    Product(
        id: 'id3',
        title: 'Футболка',
        description: 'Состав: Хлопок - 100%',
        price: 10400,
        imageUrl:
            'https://vdudvdud.ru/wa-data/public/shop/products/70/00/70/images/956/956.970.jpg'),
    Product(
        id: 'id4',
        title: 'Куртка джинсовая',
        description: 'Куртка джинсовая TRUCKER',
        price: 55100,
        imageUrl:
            'https://i.pinimg.com/originals/00/c1/6c/00c16c0f0ae837f49b78d4aa4a29ad74.jpg')
  ];

  List<Product> get items {
    return [...data];
  }

  List<Product> get favouriteItems {
    return data.where((element) => element.isFavourite).toList();
  }

  Product findById(String productId) {
    return data.firstWhere((element) => element.id == productId);
  }

  void addProduct(Product productSample) {
    

    final url = Uri.parse("https://lamoda-junior-default-rtdb.asia-southeast1.firebasedatabase.app/products.json");
    http.post(url,body: json.encode({
      'title': productSample.title,
      'id':productSample.id,
      'description': productSample.description,
      'price': productSample.price,
      'imageUrl': productSample.imageUrl,
      'isFavourite': productSample.isFavourite
    })).then((response) {
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: productSample.title,
        description: productSample.description,
        price: productSample.price,
        imageUrl: productSample.imageUrl);

        data.add(newProduct);
       
        notifyListeners();
        
    });
        
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = data.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      data[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    data.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  // void delete (String id){
  //   data.removeWhere((element) => element.id == id);
  //   notifyListeners();
  // }

}
