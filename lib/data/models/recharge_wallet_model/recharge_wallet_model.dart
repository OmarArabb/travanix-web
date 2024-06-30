/// status : 1
/// message : " charges"
/// data : [{"id":1,"charge_code":"ssfsf","status":2,"tourist_id":1,"tourist_Email_address":"dfggsd@gmail.com"}]
library;

class RechargeWalletModel {
  RechargeWalletModel({
      this.status, 
      this.message, 
      this.data,});

  RechargeWalletModel.fromJson(dynamic json) {
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
/// charge_code : "ssfsf"
/// status : 2
/// tourist_id : 1
/// tourist_Email_address : "dfggsd@gmail.com"

class Data {
  Data({
      this.id, 
      this.chargeCode, 
      this.status, 
      this.touristId, 
      this.touristEmailAddress,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    chargeCode = json['charge_code'];
    status = json['status'];
    touristId = json['tourist_id'];
    touristEmailAddress = json['tourist_Email_address'];
  }
  int? id;
  String? chargeCode;
  int? status;
  int? touristId;
  String? touristEmailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['charge_code'] = chargeCode;
    map['status'] = status;
    map['tourist_id'] = touristId;
    map['tourist_Email_address'] = touristEmailAddress;
    return map;
  }

}