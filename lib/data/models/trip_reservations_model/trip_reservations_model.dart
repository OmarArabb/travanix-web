import 'data.dart';

/// status : 1
/// message : "trip gets"
/// data : [{"id":1,"reserve_id":1,"type_of_trip":"Family","trip_name":"Trip To Jordan","description":"With its desert landscapes, renowned historical and religious sites, and friendly people, Jordan is the perfect introduction to the Middle East. The famous temples of Petra might be the big draw – especially for those of us who grew up watching Indiana Jones and the Last Crusade – but there’s plenty more to see around the rest of the country too.Jordan is a great place for a road trip, with manageable distances, decent roads and cheap fuel meaning you can easily see the best of Jordan in a week. This 7-day Jordan itinerary takes you across the country, with what to see, do and where to stay along the way.","price_trip":150,"number_of_allSeat":50,"trip_start_time":"2024-09-03 08:00:00","trip_end_time":"2024-09-06 08:00:00","city_id":21,"city_name":"Jerash","nation_id":2,"nation_name":"Jordan","address":"jordan","coordinate_x":31.279862,"coordinate_y":37.1297454,"image":"/images/attraction_activities/Jerash1.jpg","places":[{"hotel_id":3},{"resturant_id":1},{"attraction_activity_id":1}],"number_of_seats_available":47,"status":"Pending","number_of_seat_reserved":2,"phone_number":"09345234343","Email_address":"nameaalbad@gmail.com","tourist_name":"nawwar","wallet":333333333,"details":[["hassan",21,1],["omar",21,2]]},{"id":1,"reserve_id":2,"type_of_trip":"Family","trip_name":"Trip To Jordan","description":"With its desert landscapes, renowned historical and religious sites, and friendly people, Jordan is the perfect introduction to the Middle East. The famous temples of Petra might be the big draw – especially for those of us who grew up watching Indiana Jones and the Last Crusade – but there’s plenty more to see around the rest of the country too.Jordan is a great place for a road trip, with manageable distances, decent roads and cheap fuel meaning you can easily see the best of Jordan in a week. This 7-day Jordan itinerary takes you across the country, with what to see, do and where to stay along the way.","price_trip":150,"number_of_allSeat":50,"trip_start_time":"2024-09-03 08:00:00","trip_end_time":"2024-09-06 08:00:00","city_id":21,"city_name":"Jerash","nation_id":2,"nation_name":"Jordan","address":"jordan","coordinate_x":31.279862,"coordinate_y":37.1297454,"image":"/images/attraction_activities/Jerash1.jpg","places":[{"hotel_id":3},{"resturant_id":1},{"attraction_activity_id":1}],"number_of_seats_available":47,"status":"Submitted","number_of_seat_reserved":1,"phone_number":"0909434","Email_address":"nameaalbad@gmail.com","tourist_name":"nawwar","wallet":333333333,"details":[["nawwar",21,3]]},{"id":1,"reserve_id":3,"type_of_trip":"Family","trip_name":"Trip To Jordan","description":"With its desert landscapes, renowned historical and religious sites, and friendly people, Jordan is the perfect introduction to the Middle East. The famous temples of Petra might be the big draw – especially for those of us who grew up watching Indiana Jones and the Last Crusade – but there’s plenty more to see around the rest of the country too.Jordan is a great place for a road trip, with manageable distances, decent roads and cheap fuel meaning you can easily see the best of Jordan in a week. This 7-day Jordan itinerary takes you across the country, with what to see, do and where to stay along the way.","price_trip":150,"number_of_allSeat":50,"trip_start_time":"2024-09-03 08:00:00","trip_end_time":"2024-09-06 08:00:00","city_id":21,"city_name":"Jerash","nation_id":2,"nation_name":"Jordan","address":"jordan","coordinate_x":31.279862,"coordinate_y":37.1297454,"image":"/images/attraction_activities/Jerash1.jpg","places":[{"hotel_id":3},{"resturant_id":1},{"attraction_activity_id":1}],"number_of_seats_available":47,"status":"Canceled","number_of_seat_reserved":3,"phone_number":"09343434","Email_address":"nameaalbad@gmail.com","tourist_name":"nawwar","wallet":333333333,"details":[["hassan",21,4],["omar",21,5],["nawwar",21,6]]}]

class TripReservationsModel {
  TripReservationsModel({
      this.status, 
      this.message, 
      this.data,});

  TripReservationsModel.fromJson(dynamic json) {
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