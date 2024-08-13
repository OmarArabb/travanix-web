import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/hotel_reservations_model/hotel_reservations_model.dart';
import 'package:travanix/data/models/trip_reservations_model/trip_reservations_model.dart';

class GetReservationsRepo {
  Future<Either<Failure, TripReservationsModel>> getTripReservations() async {
    try {
      TripReservationsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetTripsReserved',
      );

      model = TripReservationsModel.fromJson(data);
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

  Future<Either<Failure, HotelReservationsModel>> getHotelReservations() async {
    try {
      HotelReservationsModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetReserved',
      );

      model = HotelReservationsModel.fromJson(data);
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
