import 'dart:convert';
import 'package:e_commerce_app/core/helpers/storage_helper.dart';
import 'package:e_commerce_app/features/auth/data/auth_api/api_end_points.dart';
import 'package:e_commerce_app/features/profile/data/models/profile_model.dart';
import 'package:http/http.dart' as http;
import '../models/profile_error_model.dart';

class ProfileApi {
  Future<ProfileModel> getProfile() async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.profile);
    String? token = await StorageHelper.getToken();
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    var json = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ProfileModel profileModel = ProfileModel.fromJson(json);
      return profileModel;
    } else {
      ProfileErrorModel errorModel = ProfileErrorModel.fromJson(json);
      throw Exception(errorModel.message);
    }
  }
}
