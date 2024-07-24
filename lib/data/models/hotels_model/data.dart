/// id : 1
/// address : "Dubai"
/// coordinate_y : 55.185241156464
/// coordinate_x : 25.141418876386
/// city_name : "Dubai"
/// nation_name : "United Arab Emirates"
/// simple_description_about_hotel : "A hotel that's home to cutting-edge engineering from the unique man-made beach and infinity pool terrace, to one of the tallest grand More"
/// hotel_name : "Burj Al Arab"
/// hotel_class : 7
/// phone_number : "+971 4 301 7777"
/// images : ["/images/hotels/Burj Al Arab1.jpg","/images/hotels/Burj Al Arab2.jpg","/images/hotels/Burj Al Arab3.jpg","/images/hotels/Burj Al Arab4.jpg","/images/hotels/Burj Al Arab5.jpg","/images/hotels/Burj Al Arab6.jpg","/images/hotels/Burj Al Arab7.jpg","/images/hotels/Burj Al Arab8.jpg"]
/// services : ["Free wifi","Parking free","Buffer dinner","Breakfast"]
library;

class Data {
  Data({
      this.id, 
      this.address, 
      this.coordinateY, 
      this.coordinateX, 
      this.cityName, 
      this.nationName, 
      this.simpleDescriptionAboutHotel, 
      this.hotelName, 
      this.hotelClass, 
      this.phoneNumber, 
      this.images, 
      this.services,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    coordinateY = json['coordinate_y'];
    coordinateX = json['coordinate_x'];
    cityName = json['city_name'];
    nationName = json['nation_name'];
    simpleDescriptionAboutHotel = json['simple_description_about_hotel'];
    hotelName = json['hotel_name'];
    hotelClass = json['hotel_class'];
    phoneNumber = json['phone_number'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    services = json['services'] != null ? json['services'].cast<String>() : [];
  }
  int? id;
  String? address;
  double? coordinateY;
  double? coordinateX;
  String? cityName;
  String? nationName;
  String? simpleDescriptionAboutHotel;
  String? hotelName;
  int? hotelClass;
  String? phoneNumber;
  List<String>? images;
  List<String>? services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['coordinate_y'] = coordinateY;
    map['coordinate_x'] = coordinateX;
    map['city_name'] = cityName;
    map['nation_name'] = nationName;
    map['simple_description_about_hotel'] = simpleDescriptionAboutHotel;
    map['hotel_name'] = hotelName;
    map['hotel_class'] = hotelClass;
    map['phone_number'] = phoneNumber;
    map['images'] = images;
    map['services'] = services;
    return map;
  }

}