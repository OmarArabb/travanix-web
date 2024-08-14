/// status : 1
/// message : "succes   "
/// avg_rate : 4

class RateModel {
  RateModel({
      this.status, 
      this.message, 
      this.avgRate,});

  RateModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    avgRate = json['avg_rate'];
  }
  int? status;
  String? message;
  int? avgRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['avg_rate'] = avgRate;
    return map;
  }

}