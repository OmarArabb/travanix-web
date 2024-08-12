import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/search_hotels_model/search_hotels_model.dart';
import 'package:travanix/data/models/search_restaurants_model/search_restaurants_model.dart';
import 'package:travanix/data/models/search_tourist_dis_model/search_tourist_dis_model.dart';


class SearchRepo {
  Future<Either<Failure, SearchHotelsModel>> searchHotels({Map<String,dynamic>? parameters}) async {
    try {
      SearchHotelsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminSearchHotel',
        parameters: parameters
      );

      model = SearchHotelsModel.fromJson(data);
      return Right(model);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, SearchRestaurantsModel>> searchRestaurants({Map<String,dynamic>? parameters}) async {
    try {
      SearchRestaurantsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminSearchResturant',
        parameters: parameters
      );

      model = SearchRestaurantsModel.fromJson(data);
      return Right(model);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, SearchTouristDisModel>> searchTouristDis({Map<String,dynamic>? parameters}) async {
    try {
      SearchTouristDisModel? model;
      var data = await ApiService.get(
        endPoint: 'adminSearchattraction_activity',
        parameters: parameters
      );

      model = SearchTouristDisModel.fromJson(data);
      return Right(model);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }


}
