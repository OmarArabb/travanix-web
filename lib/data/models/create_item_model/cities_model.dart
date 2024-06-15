/// status : 1
/// message : "cities in nation "
/// data : [{"id":1,"city_name":"Damascus","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":2,"city_name":"RefDamascus","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":3,"city_name":"Quneitra","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":4,"city_name":"Daraa","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":5,"city_name":"Al-Suwayda","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":6,"city_name":"Homs","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":7,"city_name":"Tartus","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":8,"city_name":"Latakia","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":9,"city_name":"Hama","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":10,"city_name":"Idlib","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":11,"city_name":"Aleppo","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":12,"city_name":"Raqqa","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":13,"city_name":"Deir ez-Zor","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"},{"id":14,"city_name":"Al-Hasakah","nation_id":1,"created_at":"2024-06-04 19:23:05","updated_at":"2024-06-04 19:23:05"}]
library;

class CitiesModel {
  CitiesModel({
      this.status, 
      this.message, 
      this.data,});

  CitiesModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// city_name : "Damascus"
/// nation_id : 1
/// created_at : "2024-06-04 19:23:05"
/// updated_at : "2024-06-04 19:23:05"

class Data {
  Data({
      this.id, 
      this.cityName, 
      this.nationId, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    cityName = json['city_name'];
    nationId = json['nation_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? cityName;
  int? nationId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city_name'] = cityName;
    map['nation_id'] = nationId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}