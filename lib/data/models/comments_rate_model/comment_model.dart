import 'data.dart';

/// status : 1
/// message : "succes   "
/// data : [{"tourist_id":1,"tourist_name":"nawwar","Email_address":"nameaalbad@gmail.com","hotel_id":2,"comment_id":2,"comment":"Good Hotel","rate":4.5}]

class CommentModel {
  CommentModel({
    this.status,
    this.message,
    this.data,
    this.avgRate,
  });

  CommentModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    avgRate = json['avg_rate'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  int? status;
  String? message;
  double? avgRate;
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
