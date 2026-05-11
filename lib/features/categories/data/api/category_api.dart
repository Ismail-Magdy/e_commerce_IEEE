import 'dart:convert';

import 'package:e_commerce_app/features/auth/data/auth_api/api_end_points.dart';
import 'package:e_commerce_app/features/categories/data/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  Future<List<CategoryModel>> getAllCategories() async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.allCategories);
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    List<CategoryModel> categories = json.map((element) {
      return CategoryModel.fromJson(element);
    }).toList();
    return categories;
  }
}
