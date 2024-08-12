import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/trip_reservations_model/trip_reservations_model.dart';

class EditReservationStatusRepo{
  Future<Either<Failure, String>> editTripReservation(Map<String,dynamic> data) async {
    try {

      var result = await ApiService.post(
        endPoint: 'adminUpdateTripReserved',
        data: data
      );

      return Right(result['message']);
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


  // Future<Either<Failure, String>> editHotelReservation(Map<String,dynamic> data) async {
  //   try {
  //
  //     var result = await ApiService.post(
  //       endPoint: 'adminGetReserved',
  //       data: data
  //     );
  //
  //
  //     return Right(result['message']);
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