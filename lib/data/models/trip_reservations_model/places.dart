
class Places {
  Places({
      this.hotelId,});

  Places.fromJson(dynamic json) {
    hotelId = json['hotel_id'];
  }
  int? hotelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotel_id'] = hotelId;
    return map;
  }

}