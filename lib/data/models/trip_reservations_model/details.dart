

class Details {
  Details({
      this.name, 
      this.age, 
      this.id,});

  Details.fromJson(dynamic json) {
    name = json['name'];
    age = json['age'];
    id = json['id'];
  }
  String? name;
  int? age;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['age'] = age;
    map['id'] = id;
    return map;
  }

}