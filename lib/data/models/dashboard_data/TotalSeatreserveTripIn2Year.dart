/// current_year_total_seat : "1"
/// previous_year_total_seat : "0"
/// year : 2024

class TotalSeatreserveTripIn2Year {
  TotalSeatreserveTripIn2Year({
      this.currentYearTotalSeat, 
      this.previousYearTotalSeat, 
      this.year,});

  TotalSeatreserveTripIn2Year.fromJson(dynamic json) {
    currentYearTotalSeat = json['current_year_total_seat'];
    previousYearTotalSeat = json['previous_year_total_seat'];
    year = json['year'];
  }
  String? currentYearTotalSeat;
  String? previousYearTotalSeat;
  int? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_year_total_seat'] = currentYearTotalSeat;
    map['previous_year_total_seat'] = previousYearTotalSeat;
    map['year'] = year;
    return map;
  }

}