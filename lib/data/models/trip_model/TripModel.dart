import 'Data.dart';

/// status : 1
/// message : "trip gets"
/// data : {"id":1,"type_of_trip":"Family","trip_name":"Trip To Jordan","description":"With its desert landscapes, renowned historical and religious sites, and friendly people, Jordan is the perfect introduction to the Middle East. The famous temples of Petra might be the big draw – especially for those of us who grew up watching Indiana Jones and the Last Crusade – but there’s plenty more to see around the rest of the country too.Jordan is a great place for a road trip, with manageable distances, decent roads and cheap fuel meaning you can easily see the best of Jordan in a week. This 7-day Jordan itinerary takes you across the country, with what to see, do and where to stay along the way.","price_trip":150,"number_of_allSeat":50,"trip_start_time":"2024-09-03 08:00:00","trip_end_time":"2024-09-06 08:00:00","city_id":21,"city_name":"Jerash","nation_id":2,"nation_name":"Jordan","address":"jordan","coordinate_x":31.279862,"coordinate_y":37.1297454,"image":"/images/attraction_activities/Jerash1.jpg","places":[{"hotel_id":3},{"resturant_id":1},{"attraction_activity_id":1}],"number_of_seats_available":47}

class TripModel {
  TripModel({
      this.status, 
      this.message, 
      this.data,});

  TripModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}