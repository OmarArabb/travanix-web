import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/attractions_model/attractions_model.dart';
import 'package:travanix/data/models/hotels_model/hotel_model.dart';
import 'package:travanix/data/models/restaurants_model/restaurants_model.dart';

class GetItemsRepo {
  Future<Either<Failure, HotelModel>> getHotels() async {
    try {
      HotelModel? model;
      var data = await ApiService.get(
          endPoint: 'adminGetHotels',
          );

      model = HotelModel.fromJson(data);
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

  Future<Either<Failure, RestaurantsModel>> getRestaurants() async {
    try {
      RestaurantsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetResturants',
      );

      model = RestaurantsModel.fromJson(data);
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


  Future<Either<Failure, AttractionsModel>> getAttractions() async {
    try {
      AttractionsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetAttraction_activites',
      );

      model = AttractionsModel.fromJson(data);
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
