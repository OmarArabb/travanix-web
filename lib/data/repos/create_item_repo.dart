import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/create_item_model/cities_model.dart';
import 'package:travanix/data/models/create_item_model/services_model.dart';

class CreateItemRepo {

  Future<Either<Failure, ServicesModel>> getServices() async {
    try {
      ServicesModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetServices',
      );

      model = ServicesModel.fromJson(data);
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

  Future<Either<Failure, CitiesModel>> getCity({
    required int countryId,
  }) async {
    try {
      CitiesModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetCitiesByNation/$countryId}',
      );

      model = CitiesModel.fromJson(data);
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

  Future<Either<Failure, String>> createHotel({
    required Map<String, dynamic> data,
  }) async {
    try {
      var response =
          await ApiService.post(endPoint: 'adminCreateHotel', data: data);

      return Right(response['message']);
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

  Future<Either<Failure, String>> createRestaurant({
    required Map<String, dynamic> data,
  }) async {
    try {
      var response =
          await ApiService.post(endPoint: 'adminCreateResturant', data: data);

      return Right(response['message']);
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

  Future<Either<Failure, String>> createTouristDis({
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await ApiService.post(
          endPoint: 'adminCreateAttraction_activity', data: data);

      return Right(response['message']);
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

  Future<Either<Failure, String>> createTrip({
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await ApiService.post(
          endPoint: 'adminCreateTrip', data: data);

      return Right(response['message']);
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
