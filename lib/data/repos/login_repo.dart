import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:travanix/core/functions/api_services.dart';

import 'package:travanix/data/models/login_model/login_model.dart';

class LoginRepo {
  Future<Either<Failure, LoginModel>> login(
      {required String email, required String password}) async {
    try {
      LoginModel? model;
      var data = await ApiService.post(
          endPoint: 'adminLogin',
          data: {"Email_address": email, "Password": password});

      model = LoginModel.fromJson(data);
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
