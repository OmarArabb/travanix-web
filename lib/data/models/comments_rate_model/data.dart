/// tourist_id : 1
/// tourist_name : "nawwar"
/// Email_address : "nameaalbad@gmail.com"
/// hotel_id : 2
/// comment_id : 2
/// comment : "Good Hotel"
/// rate : 4.5
library;

class Data {
  Data({
      this.touristId, 
      this.touristName, 
      this.emailAddress, 
      this.hotelId, 
      this.commentId, 
      this.comment, 
      this.rate,});

  Data.fromJson(dynamic json) {
    touristId = json['tourist_id'];
    touristName = json['tourist_name'];
    emailAddress = json['Email_address'];
    hotelId = json['hotel_id'];
    commentId = json['comment_id'];
    comment = json['comment'];
    rate = json['rate'];
  }
  int? touristId;
  String? touristName;
  String? emailAddress;
  int? hotelId;
  int? commentId;
  String? comment;
  double? rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tourist_id'] = touristId;
    map['tourist_name'] = touristName;
    map['Email_address'] = emailAddress;
    map['hotel_id'] = hotelId;
    map['comment_id'] = commentId;
    map['comment'] = comment;
    map['rate'] = rate;
    return map;
  }

}