import 'dart:convert';

import 'package:e_commerce_app/features/auth/data/auth_api/api_end_points.dart';
import 'package:e_commerce_app/features/auth/data/models/error_model.dart';
import 'package:e_commerce_app/features/auth/data/models/token_model.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<TokenModel> login({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.login);

    Map<String, dynamic> requestBody = {
      ApiKeys.email: email,
      ApiKeys.password: password,
    };

    var response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
    );

    var decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TokenModel token = TokenModel.fromJson(decodedResponse);
      return token;
    } else {
      ErrorModel errorModel = ErrorModel();
      throw Exception(errorModel.message);
    }
  }

  Future<TokenModel> signUp({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.signup);

    Map<String, dynamic> requestBody = {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.password: password,
      ApiKeys.avatar: avatar,
    };

    var response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
    );

    var decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TokenModel token = TokenModel.fromJson(decodedResponse);
      return token;
    } else {
      ErrorModel errorModel = ErrorModel();
      throw Exception(errorModel.message);
    }
  }
}
