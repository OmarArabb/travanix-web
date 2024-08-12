
import 'package:travanix/data/models/search_tourist_dis_model/attraction_activities.dart';

class SearchTouristDisModel {
  SearchTouristDisModel({
      this.status, 
      this.message, 
      this.attractionActivities,});

  SearchTouristDisModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['attraction_activities'] != null) {
      attractionActivities = [];
      json['attraction_activities'].forEach((v) {
        attractionActivities?.add(AttractionActivities.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<AttractionActivities>? attractionActivities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (attractionActivities != null) {
      map['attraction_activities'] = attractionActivities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}