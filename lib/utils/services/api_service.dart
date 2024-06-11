import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tamago_store/features/shop/models/category_model.dart';
import 'package:tamago_store/features/shop/models/product.dart';

class ApiService {
  final String baseUrl = "http://192.168.100.14:3000/api";

  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products/fetch'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories/fetch'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Category> categories =
          body.map((dynamic item) => Category.fromJson(item)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
