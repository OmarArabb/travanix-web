class AttractionActivities {
  AttractionActivities({
      this.id, 
      this.address, 
      this.coordinateY, 
      this.coordinateX, 
      this.cityName, 
      this.nationName, 
      this.attractionActivityName, 
      this.description, 
      this.openingTime, 
      this.closingTime, 
      this.images,});

  AttractionActivities.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    coordinateY = json['coordinate_y'];
    coordinateX = json['coordinate_x'];
    cityName = json['city_name'];
    nationName = json['nation_name'];
    attractionActivityName = json['attraction_activity_name'];
    description = json['description'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  int? id;
  String? address;
  double? coordinateY;
  double? coordinateX;
  String? cityName;
  String? nationName;
  String? attractionActivityName;
  String? description;
  String? openingTime;
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
    map['attraction_activity_name'] = attractionActivityName;
    map['description'] = description;
    map['opening_time'] = openingTime;
    map['closing_time'] = closingTime;
    map['images'] = images;
    return map;
  }

}