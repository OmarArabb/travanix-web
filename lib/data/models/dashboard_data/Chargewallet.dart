/// year : 2023
/// month : "01"
/// total : 0

class Chargewallet {
  Chargewallet({
      this.year, 
      this.month, 
      this.total,});

  Chargewallet.fromJson(dynamic json) {
    year = json['year'];
    month = json['month'];
    total = json['total'];
  }
  int? year;
  String? month;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = year;
    map['month'] = month;
    map['total'] = total;
    return map;
  }

}