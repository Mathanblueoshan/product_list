import 'dart:convert';

import 'package:api_parse_json/model/productmodel.dart';

import 'package:http/http.dart' as http;

class ProductService {


  Future<List<Products>> getProducts() async {

    final response = await http.get(Uri.parse("https://dummyjson.com/products"));

   if(response.statusCode == 200){

     var data = await jsonDecode(response.body)['products'] as List;

     final products = data.map((value) => Products.fromJson(value)).toList();
       
       return products;
       
   }else{

    throw "something went wrong!";
   }
   
  }
}
