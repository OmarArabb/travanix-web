import 'data.dart';

/// status : 1
/// message : "attraction_activities gets"
/// data : [{"id":1,"address":"dfdf","coordinate_y":1,"coordinate_x":1,"city_name":"Damascus","nation_name":"Syrian Arab Republic","attraction_activity_name":"HASSAN","description":"required","opening_time":"16:00:00","closing_time":"16:00:00","images":["/images/attraction_activities/HASSAN1.jpg"]}]

class AttractionsModel {
  AttractionsModel({
      this.status, 
      this.message, 
      this.data,});

  AttractionsModel.fromJson(dynamic json) {
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