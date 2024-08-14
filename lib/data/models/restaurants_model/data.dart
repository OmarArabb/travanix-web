/// id : 1
/// address : "dfdf"
/// coordinate_y : 1
/// coordinate_x : 1
/// city_name : "Damascus"
/// nation_name : "Syrian Arab Republic"
/// type_of_food : "dddddd"
/// descreption : "descreption"
/// resturant_name : "HASSAN"
/// resturant_class : 1.2
/// phone_number : "14:15:16"
/// opining_time : "14:15:16"
/// closing_time : "14:12:12"
/// images : ["/images/resturants/HASSAN1.jpg"]
library;

class Data {
  Data({
      this.id, 
      this.address, 
      this.coordinateY, 
      this.coordinateX, 
      this.cityName, 
      this.nationName, 
      this.typeOfFood, 
      this.descreption, 
      this.resturantName, 
      this.resturantClass, 
      this.phoneNumber, 
      this.opiningTime, 
      this.closingTime, 
      this.images,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    coordinateY = json['coordinate_y'];
    coordinateX = json['coordinate_x'];
    cityName = json['city_name'];
    nationName = json['nation_name'];
    typeOfFood = json['type_of_food'];
    descreption = json['descreption'];
    resturantName = json['resturant_name'];
    resturantClass = json['resturant_class'];
    phoneNumber = json['phone_number'];
    opiningTime = json['opining_time'];
    closingTime = json['closing_time'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  int? id;
  String? address;
  double? coordinateY;
  double? coordinateX;
  String? cityName;
  String? nationName;
  String? typeOfFood;
  String? descreption;
  String? resturantName;
  double? resturantClass;
  String? phoneNumber;
  String? opiningTime;
  String? closingTime;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['coordinate_y'] = coordinateY;
    map['coordinate_x'] = coordinateX;
    map['city_name'] = cityName;
    map['nation_name'] = nationName;
    map['type_of_food'] = typeOfFood;
    map['descreption'] = descreption;
    map['resturant_name'] = resturantName;
    map['resturant_class'] = resturantClass;
    map['phone_number'] = phoneNumber;
    map['opining_time'] = opiningTime;
    map['closing_time'] = closingTime;
    map['images'] = images;
    return map;
  }

}