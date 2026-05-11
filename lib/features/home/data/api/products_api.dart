import 'dart:convert';
import 'package:e_commerce_app/features/auth/data/auth_api/api_end_points.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsApi {
  Future<List<ProductModel>> getAllProducts() async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.allProduct);
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    List<ProductModel> products = json.map((element) {
      return ProductModel.fromJson(element);
    }).toList();
    return products;
  }

  Future<List<ProductModel>> getProductById(int categoryId) async {
    Uri url = Uri.parse(
      "${ApiEndPoints.baseUrl}${ApiEndPoints.allProduct}?categoryId=$categoryId",
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    List<ProductModel> products = json.map((element) {
      return ProductModel.fromJson(element);
    }).toList();
    return products;
  }
}
