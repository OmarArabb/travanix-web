

class Data {
  Data({
      this.id, 
      this.quantity, 
      this.capacityRoom, 
      this.priceRoom, 
      this.hotelId,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    capacityRoom = json['capacity_room'];
    priceRoom = json['price_room'];
    hotelId = json['hotel_id'];
  }
  int? id;
  int? quantity;
  int? capacityRoom;
  int? priceRoom;
  int? hotelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['capacity_room'] = capacityRoom;
    map['price_room'] = priceRoom;
    map['hotel_id'] = hotelId;
    return map;
  }

}