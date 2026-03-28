import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reactivehub/models/product_model.dart';

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    //https: //fakestoreapi.com/products
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body);
      return list
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
