import 'data.dart';

/// status : 1
/// message : "succes"
/// data : [{"id":1,"hotel_id":1,"hotel_name":"Burj Al Arab","Email_address":"nameaalbad@gmail.com","tourist_name":"nawwar","wallet":333333333,"status":"Pending","price_all_reserve":990,"start_reservation":"2024-09-01","end_reservation":"2024-09-03","rooms":[{"capacity_room":1,"number":3},{"capacity_room":1,"number":1}]},{"id":2,"hotel_id":2,"hotel_name":"Jumeirah Beach Hotel","Email_address":"nameaalbad@gmail.com","tourist_name":"nawwar","wallet":333333333,"status":"Canceled","price_all_reserve":1120,"start_reservation":"2024-10-01","end_reservation":"2024-10-03","rooms":[{"capacity_room":4,"number":3},{"capacity_room":4,"number":1},{"capacity_room":4,"number":1}]},{"id":3,"hotel_id":3,"hotel_name":"Kempinski Hotel Ishtar Dead Sea","Email_address":"nameaalbad@gmail.com","tourist_name":"nawwar","wallet":333333333,"status":"Submitted","price_all_reserve":500,"start_reservation":"2024-11-01","end_reservation":"2024-11-03","rooms":[{"capacity_room":3,"number":1}]}]

class HotelReservationsModel {
  HotelReservationsModel({
      this.status, 
      this.message, 
      this.data,});

  HotelReservationsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(HotelReservationData.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<HotelReservationData>? data;

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