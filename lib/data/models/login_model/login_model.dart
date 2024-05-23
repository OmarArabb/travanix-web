/// status : 1
/// message : "loged in"
/// access_token : "6|DPabjagx7UXxUqTnqjiBxHaIeAzThB76nXSwK9hUfe4fdf3f"

class LoginModel {
  LoginModel({
      required this.status,
      required this.message,
      required this.accessToken,});

  late int? status;
  late String? message;
  late String? accessToken;

  LoginModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['access_token'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['access_token'] = accessToken;
    return map;
  }

}