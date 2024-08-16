import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';

class UpdateItemRepo{
  Future<Either<Failure, String>> updateTrip({required Map<String,dynamic> data}) async {
    try {

      var response = await ApiService.put(
        endPoint: 'adminUpdateTrip',
        data: data
      );


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