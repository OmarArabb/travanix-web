import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/rooms_model/rooms_model.dart';

class GetRoomsRepo{
  Future<Either<Failure, RoomsModel>> getRooms({
    required int hotelId,
  }) async {
    try {
      RoomsModel model;
      var data =
      await ApiService.get(endPoint: 'adminGetRooms/$hotelId', );

      model = RoomsModel.fromJson(data);
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