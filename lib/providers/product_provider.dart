import 'package:aldo_shop/models/product_model.dart';
import 'package:aldo_shop/services/product_service.dart';
import 'package:flutter/material.dart';

class productProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProduct();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
