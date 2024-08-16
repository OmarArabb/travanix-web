import 'Data.dart';

/// status : 1
/// message : "succes   "
/// data : {"number of tourist regester":2,"number of trip in 2 year":[{"current_year_total_seat":3,"previous_year_total_seat":0,"year":2024}],"chargewallet":[{"year":2023,"month":"01","total":0},{"year":2024,"month":"01","total":0},{"year":2023,"month":"02","total":0},{"year":2024,"month":"02","total":0},{"year":2023,"month":"03","total":0},{"year":2024,"month":"03","total":0},{"year":2023,"month":"04","total":0},{"year":2024,"month":"04","total":0},{"year":2023,"month":"05","total":0},{"year":2024,"month":"05","total":0},{"year":2023,"month":"06","total":0},{"year":2024,"month":"06","total":0},{"year":2023,"month":"07","total":0},{"year":2024,"month":"07","total":0},{"year":2023,"month":"08","total":0},{"year":2024,"month":"08","total":0},{"year":2023,"month":"09","total":0},{"year":2024,"month":"09","total":0},{"year":2023,"month":"10","total":0},{"year":2024,"month":"10","total":0},{"year":2023,"month":"11","total":0},{"year":2024,"month":"11","total":0},{"year":2023,"month":"12","total":0},{"year":2024,"month":"12","total":0}],"total_seatreserve trip in 2 year":[{"current_year_total_seat":"1","previous_year_total_seat":"0","year":2024}],"total_reserve hotel in 2 year":[{"current_year_total_seat":1,"previous_year_total_seat":0,"year":2024}]}

class DashBoardModel {
  DashBoardModel({
      this.status, 
      this.message, 
      this.data,});

  DashBoardModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}