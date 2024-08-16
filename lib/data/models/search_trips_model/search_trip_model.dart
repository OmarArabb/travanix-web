import 'trips.dart';

/// status : 1
/// message : "succes   "
/// trips : [{"id":1,"type_of_trip":"Family","trip_name":"Trip To Jordan","description":"With its desert landscapes, renowned historical and religious sites, and friendly people, Jordan is the perfect introduction to the Middle East. The famous temples of Petra might be the big draw – especially for those of us who grew up watching Indiana Jones and the Last Crusade – but there’s plenty more to see around the rest of the country too.Jordan is a great place for a road trip, with manageable distances, decent roads and cheap fuel meaning you can easily see the best of Jordan in a week. This 7-day Jordan itinerary takes you across the country, with what to see, do and where to stay along the way.","price_trip":150,"number_of_allSeat":50,"trip_start_time":"2024-09-03 08:00:00","trip_end_time":"2024-09-06 08:00:00","address":"jordan","coordinate_y":37.1297454,"coordinate_x":31.279862,"city_id":21,"city_name":"Jerash","nation_id":2,"nation_name":"Jordan","image":"/images/attraction_activities/Jerash1.jpg","places":[{"hotel_id":3},{"resturant_id":1},{"attraction_activity_id":1}],"number_of_seats_available":42},{"id":2,"type_of_trip":"Family","trip_name":"trip ","description":"bad trip","price_trip":1,"number_of_allSeat":111,"trip_start_time":"2024-09-03 08:00:00","trip_end_time":"2024-09-06 08:00:00","address":"jordan","coordinate_y":37.1297454,"coordinate_x":31.279862,"city_id":21,"city_name":"Jerash","nation_id":2,"nation_name":"Jordan","image":"/images/attraction_activities/Jerash1.jpg","places":[{"hotel_id":3},{"hotel_id":1},{"hotel_id":2},{"resturant_id":1},{"attraction_activity_id":1}],"number_of_seats_available":111}]

class TripsModel {
  TripsModel({
      this.status, 
      this.message, 
      this.trips,});

  TripsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['trips'] != null) {
      trips = [];
      json['trips'].forEach((v) {
        trips?.add(Trips.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<Trips>? trips;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (trips != null) {
      map['trips'] = trips?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}