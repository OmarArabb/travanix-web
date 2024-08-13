import 'places.dart';
import 'details.dart';

/// id : 1
/// reserve_id : 1
/// type_of_trip : "Family"
/// trip_name : "Trip To Jordan"
/// description : "With its desert landscapes, renowned historical and religious sites, and friendly people, Jordan is the perfect introduction to the Middle East. The famous temples of Petra might be the big draw – especially for those of us who grew up watching Indiana Jones and the Last Crusade – but there’s plenty more to see around the rest of the country too.Jordan is a great place for a road trip, with manageable distances, decent roads and cheap fuel meaning you can easily see the best of Jordan in a week. This 7-day Jordan itinerary takes you across the country, with what to see, do and where to stay along the way."
/// price_trip : 150
/// number_of_allSeat : 50
/// trip_start_time : "2024-09-03 08:00:00"
/// trip_end_time : "2024-09-06 08:00:00"
/// city_id : 21
/// city_name : "Jerash"
/// nation_id : 2
/// nation_name : "Jordan"
/// address : "jordan"
/// coordinate_x : 31.279862
/// coordinate_y : 37.1297454
/// image : "/images/attraction_activities/Jerash1.jpg"
/// places : [{"hotel_id":3},{"resturant_id":1},{"attraction_activity_id":1}]
/// number_of_seats_available : 47
/// status : "Canceled"
/// number_of_seat_reserved : 2
/// phone_number : "09345234343"
/// Email_address : "nameaalbad@gmail.com"
/// tourist_name : "nawwar"
/// wallet : 333333333
/// details : [{"name":"hassan","age":21,"id":1},{"name":"omar","age":21,"id":2}]

class Data {
  Data({
      this.id, 
      this.reserveId, 
      this.typeOfTrip, 
      this.tripName, 
      this.description, 
      this.priceTrip, 
      this.numberOfAllSeat, 
      this.tripStartTime, 
      this.tripEndTime, 
      this.cityId, 
      this.cityName, 
      this.nationId, 
      this.nationName, 
      this.address, 
      this.coordinateX, 
      this.coordinateY, 
      this.image, 
      this.places, 
      this.numberOfSeatsAvailable, 
      this.status, 
      this.numberOfSeatReserved, 
      this.phoneNumber, 
      this.emailAddress, 
      this.touristName, 
      this.wallet, 
      this.details,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    reserveId = json['reserve_id'];
    typeOfTrip = json['type_of_trip'];
    tripName = json['trip_name'];
    description = json['description'];
    priceTrip = json['price_trip'];
    numberOfAllSeat = json['number_of_allSeat'];
    tripStartTime = json['trip_start_time'];
    tripEndTime = json['trip_end_time'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    nationId = json['nation_id'];
    nationName = json['nation_name'];
    address = json['address'];
    coordinateX = json['coordinate_x'];
    coordinateY = json['coordinate_y'];
    image = json['image'];
    if (json['places'] != null) {
      places = [];
      json['places'].forEach((v) {
        places?.add(Places.fromJson(v));
      });
    }
    numberOfSeatsAvailable = json['number_of_seats_available'];
    status = json['status'];
    numberOfSeatReserved = json['number_of_seat_reserved'];
    phoneNumber = json['phone_number'];
    emailAddress = json['Email_address'];
    touristName = json['tourist_name'];
    wallet = json['wallet'];
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details?.add(Details.fromJson(v));
      });
    }
  }
  int? id;
  int? reserveId;
  String? typeOfTrip;
  String? tripName;
  String? description;
  int? priceTrip;
  int? numberOfAllSeat;
  String? tripStartTime;
  String? tripEndTime;
  int? cityId;
  String? cityName;
  int? nationId;
  String? nationName;
  String? address;
  double? coordinateX;
  double? coordinateY;
  String? image;
  List<Places>? places;
  int? numberOfSeatsAvailable;
  String? status;
  int? numberOfSeatReserved;
  String? phoneNumber;
  String? emailAddress;
  String? touristName;
  int? wallet;
  List<Details>? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['reserve_id'] = reserveId;
    map['type_of_trip'] = typeOfTrip;
    map['trip_name'] = tripName;
    map['description'] = description;
    map['price_trip'] = priceTrip;
    map['number_of_allSeat'] = numberOfAllSeat;
    map['trip_start_time'] = tripStartTime;
    map['trip_end_time'] = tripEndTime;
    map['city_id'] = cityId;
    map['city_name'] = cityName;
    map['nation_id'] = nationId;
    map['nation_name'] = nationName;
    map['address'] = address;
    map['coordinate_x'] = coordinateX;
    map['coordinate_y'] = coordinateY;
    map['image'] = image;
    if (places != null) {
      map['places'] = places?.map((v) => v.toJson()).toList();
    }
    map['number_of_seats_available'] = numberOfSeatsAvailable;
    map['status'] = status;
    map['number_of_seat_reserved'] = numberOfSeatReserved;
    map['phone_number'] = phoneNumber;
    map['Email_address'] = emailAddress;
    map['tourist_name'] = touristName;
    map['wallet'] = wallet;
    if (details != null) {
      map['details'] = details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}