import 'resturants.dart';

/// status : 1
/// message : "succes   "
/// resturants : [{"id":1,"address":"dfdf","coordinate_y":1,"coordinate_x":1,"city_name":"Damascus","nation_name":"Syrian Arab Republic","type_of_food":"dddddd","descreption":"descreption","resturant_name":"HASSAN","resturant_class":1.2,"phone_number":"14:15:16","opining_time":"14:15:16","closing_time":"14:12:12","images":["/images/resturants/HASSAN1.jpg"]}]

class SearchRestaurantsModel {
  SearchRestaurantsModel({
      this.status, 
      this.message, 
      this.resturants,});

  SearchRestaurantsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['resturants'] != null) {
      resturants = [];
      json['resturants'].forEach((v) {
        resturants?.add(Resturants.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<Resturants>? resturants;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (resturants != null) {
      map['resturants'] = resturants?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}