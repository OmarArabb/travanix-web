import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';

class DeleteItemRepo{
  Future<Either<Failure, String>> deleteTrip({
    required int tripId,
  }) async {
    try {
      var response =
      await ApiService.delete(endPoint: 'adminDeleteTrip/$tripId',);

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