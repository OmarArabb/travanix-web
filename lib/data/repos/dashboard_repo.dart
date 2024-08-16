import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/dashboard_data/DashBoardModel.dart';

class DashboardRepo{
  Future<Either<Failure, DashBoardModel>> getDashBoard() async {
    try {
      DashBoardModel model;
      var data =
      await ApiService.get(endPoint: 'adminDashboard', );

      model = DashBoardModel.fromJson(data);
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