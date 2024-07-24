import 'data.dart';

/// status : 1
/// message : "hotel get"
/// data : [{"id":1,"address":"Dubai","coordinate_y":55.185241156464,"coordinate_x":25.141418876386,"city_name":"Dubai","nation_name":"United Arab Emirates","simple_description_about_hotel":"A hotel that's home to cutting-edge engineering from the unique man-made beach and infinity pool terrace, to one of the tallest grand More","hotel_name":"Burj Al Arab","hotel_class":7,"phone_number":"+971 4 301 7777","images":["/images/hotels/Burj Al Arab1.jpg","/images/hotels/Burj Al Arab2.jpg","/images/hotels/Burj Al Arab3.jpg","/images/hotels/Burj Al Arab4.jpg","/images/hotels/Burj Al Arab5.jpg","/images/hotels/Burj Al Arab6.jpg","/images/hotels/Burj Al Arab7.jpg","/images/hotels/Burj Al Arab8.jpg"],"services":["Free wifi","Parking free","Buffer dinner","Breakfast"]},{"id":2,"address":"Dubai","coordinate_y":55.188168,"coordinate_x":25.142211,"city_name":"Dubai","nation_name":"United Arab Emirates","simple_description_about_hotel":"In a striking building overlooking the Arabian Gulf, this sprawling beachfront hotel is 11 minutes' walk from Burj Al Arab and 6 km from the Mall of the Emirates.\n                Upscale rooms with gulf views feature decor ranging from modern to muted, plus floor-to-ceiling windows","hotel_name":"Jumeirah Beach Hotel","hotel_class":5,"phone_number":"+971 4 366 5000","images":["/images/hotels/Jumeirah Beach Hotel1.jpg","/images/hotels/Jumeirah Beach Hotel2.jpg","/images/hotels/Jumeirah Beach Hotel3.jpg","/images/hotels/Jumeirah Beach Hotel4.jpg","/images/hotels/Jumeirah Beach Hotel5.jpg","/images/hotels/Jumeirah Beach Hotel6.jpg","/images/hotels/Jumeirah Beach Hotel7.jpg","/images/hotels/Jumeirah Beach Hotel8.jpg"],"services":["Free wifi","Parking free","Buffer dinner","Breakfast"]}]

class HotelModel {
  HotelModel({
      this.status, 
      this.message, 
      this.data,});

  HotelModel.fromJson(dynamic json) {
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