/// status : 1
/// message : "services"
/// data : [{"id":1,"service":"Free wifi"},{"id":2,"service":"good breakfast"}]
library;

class ServicesModel {
  ServicesModel({
      this.status, 
      this.message, 
      this.data,});

  ServicesModel.fromJson(dynamic json) {
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
/// service : "Free wifi"

class Data {
  Data({
      this.id, 
      this.service,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    service = json['service'];
  }
  int? id;
  String? service;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service'] = service;
    return map;
  }

}