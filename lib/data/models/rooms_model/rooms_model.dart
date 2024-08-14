import 'data.dart';

/// status : 1
/// message : "succes"
/// data : [{"id":1,"quantity":5,"capacity_room":1,"price_room":150,"hotel_id":1},{"id":2,"quantity":10,"capacity_room":2,"price_room":280,"hotel_id":1},{"id":3,"quantity":10,"capacity_room":3,"price_room":400,"hotel_id":1},{"id":10,"quantity":600,"capacity_room":5,"price_room":600,"hotel_id":1}]

class RoomsModel {
  RoomsModel({
      this.status, 
      this.message, 
      this.data,});

  RoomsModel.fromJson(dynamic json) {
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