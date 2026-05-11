class ProfileErrorModel {
  String? message;
  int? statusCode;

  ProfileErrorModel({this.message, this.statusCode});

  ProfileErrorModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["statusCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["statusCode"] = statusCode;
    return data;
  }
}
