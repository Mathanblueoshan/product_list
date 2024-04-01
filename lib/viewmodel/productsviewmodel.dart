import 'package:api_parse_json/model/productmodel.dart';
import 'package:api_parse_json/provider/productprovider.dart';
import 'package:flutter/material.dart';

class ProductsViewModel with ChangeNotifier{

  final _productService = ProductService(); //get api response 

  List<Products> _products = [];

  List<Products> get products  => _products;

  Future<void> getAllProducts() async {
      
      final response = await _productService.getProducts();

      _products = response;
      
      notifyListeners();


  }
}