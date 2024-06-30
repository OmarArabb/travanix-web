import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/recharge_wallet_model/recharge_wallet_model.dart';

class RechargeWalletRepo {
  Future<Either<Failure, RechargeWalletModel>> getRequestToRecharge() async {
    try {
      RechargeWalletModel? model;
      var data = await ApiService.get(
        endPoint: 'adminGetAllCharges',
      );

      model = RechargeWalletModel.fromJson(data);
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

  Future<Either<Failure, String>> rechargeWallet(
      {required int id, required bool status, required int amount}) async {
    try {
      var data = await ApiService.post(
        endPoint: 'adminCharge',
        data: {
          'id': id,
          'status': status,
          'wallet': amount,
        },
      );

      return Right(data['message']);
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
