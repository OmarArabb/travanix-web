import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/attractions_model/attractions_model.dart';
import 'package:travanix/data/models/hotels_model/hotel_model.dart';
import 'package:travanix/data/models/restaurants_model/restaurants_model.dart';

class GetItemByIdRepo {
  Future<Either<Failure, HotelModel>> getHotelsById({required int id}) async {
    try {
      HotelModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetHotelById/$id',
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

  Future<Either<Failure, RestaurantsModel>> getRestaurantsById({required int id}) async {
    try {
      RestaurantsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetResturantById/$id',
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

  Future<Either<Failure, AttractionsModel>> getAttractionsById({required int id}) async {
    try {
      AttractionsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetAttraction_activiteById/$id',
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

  // Future<Either<Failure, AttractionsModel>> getTripById({required int id}) async {
  //   try {
  //     AttractionsModel? model;
  //     var data = await ApiService.get(
  //       endPoint: 'adminGetTripById/$id',
  //     );
  //
  //     model = AttractionsModel.fromJson(data);
  //     return Right(model);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioError(e),
  //       );
  //     }
  //
  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }
  // }

}
