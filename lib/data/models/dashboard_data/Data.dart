import 'NumberOfTripIn2Year.dart';
import 'Chargewallet.dart';
import 'TotalSeatreserveTripIn2Year.dart';
import 'TotalReserveHotelIn2Year.dart';

/// number of tourist regester : 2
/// number of trip in 2 year : [{"current_year_total_seat":3,"previous_year_total_seat":0,"year":2024}]
/// chargewallet : [{"year":2023,"month":"01","total":0},{"year":2024,"month":"01","total":0},{"year":2023,"month":"02","total":0},{"year":2024,"month":"02","total":0},{"year":2023,"month":"03","total":0},{"year":2024,"month":"03","total":0},{"year":2023,"month":"04","total":0},{"year":2024,"month":"04","total":0},{"year":2023,"month":"05","total":0},{"year":2024,"month":"05","total":0},{"year":2023,"month":"06","total":0},{"year":2024,"month":"06","total":0},{"year":2023,"month":"07","total":0},{"year":2024,"month":"07","total":0},{"year":2023,"month":"08","total":0},{"year":2024,"month":"08","total":0},{"year":2023,"month":"09","total":0},{"year":2024,"month":"09","total":0},{"year":2023,"month":"10","total":0},{"year":2024,"month":"10","total":0},{"year":2023,"month":"11","total":0},{"year":2024,"month":"11","total":0},{"year":2023,"month":"12","total":0},{"year":2024,"month":"12","total":0}]
/// total_seatreserve trip in 2 year : [{"current_year_total_seat":"1","previous_year_total_seat":"0","year":2024}]
/// total_reserve hotel in 2 year : [{"current_year_total_seat":1,"previous_year_total_seat":0,"year":2024}]

class Data {
  Data({
      this.numberoftouristregester, 
      this.numberoftripin2year, 
      this.chargewallet, 
      this.totalSeatreservetripin2year, 
      this.totalReservehotelin2year,});

  Data.fromJson(dynamic json) {
    numberoftouristregester = json['number of tourist regester'];
    if (json['number of trip in 2 year'] != null) {
      numberoftripin2year = [];
      json['number of trip in 2 year'].forEach((v) {
        numberoftripin2year?.add(NumberOfTripIn2Year.fromJson(v));
      });
    }
    if (json['chargewallet'] != null) {
      chargewallet = [];
      json['chargewallet'].forEach((v) {
        chargewallet?.add(Chargewallet.fromJson(v));
      });
    }
    if (json['total_seatreserve trip in 2 year'] != null) {
      totalSeatreservetripin2year = [];
      json['total_seatreserve trip in 2 year'].forEach((v) {
        totalSeatreservetripin2year?.add(TotalSeatreserveTripIn2Year.fromJson(v));
      });
    }
    if (json['total_reserve hotel in 2 year'] != null) {
      totalReservehotelin2year = [];
      json['total_reserve hotel in 2 year'].forEach((v) {
        totalReservehotelin2year?.add(TotalReserveHotelIn2Year.fromJson(v));
      });
    }
  }
  int? numberoftouristregester;
  List<NumberOfTripIn2Year>? numberoftripin2year;
  List<Chargewallet>? chargewallet;
  List<TotalSeatreserveTripIn2Year>? totalSeatreservetripin2year;
  List<TotalReserveHotelIn2Year>? totalReservehotelin2year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number of tourist regester'] = numberoftouristregester;
    if (numberoftripin2year != null) {
      map['number of trip in 2 year'] = numberoftripin2year?.map((v) => v.toJson()).toList();
    }
    if (chargewallet != null) {
      map['chargewallet'] = chargewallet?.map((v) => v.toJson()).toList();
    }
    if (totalSeatreservetripin2year != null) {
      map['total_seatreserve trip in 2 year'] = totalSeatreservetripin2year?.map((v) => v.toJson()).toList();
    }
    if (totalReservehotelin2year != null) {
      map['total_reserve hotel in 2 year'] = totalReservehotelin2year?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}