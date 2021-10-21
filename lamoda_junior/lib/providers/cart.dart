import 'package:flutter/foundation.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int getLength (){
    return _items.length;
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

  double totalAmount (){
    double total = 0.0;
    _items.forEach((key, value) {total += value.price*value.quantity;});
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingProduct) => CartItem(
              id: existingProduct.id,
              price: existingProduct.price,
              quantity: existingProduct.quantity + 1,
              title: existingProduct.title));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              price: price,
              quantity: 1,
              title: title));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
