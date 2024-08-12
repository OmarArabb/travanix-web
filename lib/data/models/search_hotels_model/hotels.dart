class Hotels {
  Hotels({
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

  Hotels.fromJson(dynamic json) {
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
  dynamic hotelClass;
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