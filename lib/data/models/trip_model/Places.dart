/// hotel_id : 3

class Places {
  Places({
      this.hotelId,});

  Places.fromJson(dynamic json) {
    if(json['hotel_id'] != null){
      hotelId = json['hotel_id'];}
    else if(json['resturant_id'] != null){
      restaurantId = json['resturant_id'];
    }else if(json['attraction_activity_id'] != null){
      attractionActivityId = json['attraction_activity_id'];
    }
  }
  int? hotelId;
  int? attractionActivityId;
  int? restaurantId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotel_id'] = hotelId;
    return map;
  }

}