import 'rooms.dart';

/// id : 1
/// hotel_id : 1
/// hotel_name : "Burj Al Arab"
/// Email_address : "nameaalbad@gmail.com"
/// tourist_name : "nawwar"
/// wallet : 333333333
/// status : "Pending"
/// price_all_reserve : 990
/// start_reservation : "2024-09-01"
/// end_reservation : "2024-09-03"
/// rooms : [{"capacity_room":1,"number":3},{"capacity_room":1,"number":1}]

class HotelReservationData {
  HotelReservationData({
      this.id, 
      this.hotelId, 
      this.hotelName, 
      this.emailAddress, 
      this.touristName, 
      this.wallet, 
      this.status, 
      this.priceAllReserve, 
      this.startReservation, 
      this.endReservation, 
      this.rooms,});

  HotelReservationData.fromJson(dynamic json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    hotelName = json['hotel_name'];
    emailAddress = json['Email_address'];
    touristName = json['tourist_name'];
    wallet = json['wallet'];
    status = json['status'];
    priceAllReserve = json['price_all_reserve'];
    startReservation = json['start_reservation'];
    endReservation = json['end_reservation'];
    if (json['rooms'] != null) {
      rooms = [];
      json['rooms'].forEach((v) {
        rooms?.add(Rooms.fromJson(v));
      });
    }
  }
  int? id;
  int? hotelId;
  String? hotelName;
  String? emailAddress;
  String? touristName;
  int? wallet;
  String? status;
  int? priceAllReserve;
  String? startReservation;
  String? endReservation;
  List<Rooms>? rooms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['hotel_id'] = hotelId;
    map['hotel_name'] = hotelName;
    map['Email_address'] = emailAddress;
    map['tourist_name'] = touristName;
    map['wallet'] = wallet;
    map['status'] = status;
    map['price_all_reserve'] = priceAllReserve;
    map['start_reservation'] = startReservation;
    map['end_reservation'] = endReservation;
    if (rooms != null) {
      map['rooms'] = rooms?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}