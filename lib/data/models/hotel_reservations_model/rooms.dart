

class Rooms {
  Rooms({
      this.capacityRoom, 
      this.number,});

  Rooms.fromJson(dynamic json) {
    capacityRoom = json['capacity_room'];
    number = json['number'];
  }
  int? capacityRoom;
  int? number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['capacity_room'] = capacityRoom;
    map['number'] = number;
    return map;
  }

}