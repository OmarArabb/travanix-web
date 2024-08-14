import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/comments_rate_model/comment_model.dart';

class CommentRateRepo{
  Future<Either<Failure,CommentModel>> getReviews({required String endPoint})async {
    try {
      CommentModel model;
      var data =
      await ApiService.get(endPoint: 'adminGetAllRateAndComment?$endPoint', );
      
      var avgRate = await ApiService.get(endPoint: 'adminGetAvgRate?$endPoint');

      data['avg_rate'] = avgRate['avg_rate'];

      model = CommentModel.fromJson(data);
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

  // Future<Either<Failure,CommentModel>> getRestaurantComment({required restaurantId})async {
  //   try {
  //     CommentModel model;
  //     var data =
  //     await ApiService.get(endPoint: 'adminGetAllRateAndComment?restaurant_id=$restaurantId', );
  //
  //     model = CommentModel.fromJson(data);
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

  Future<Either<Failure,String>> deleteComment({required commentId})async {
    try {
      var data =
      await ApiService.delete(endPoint: 'adminDeleteComment/$commentId', );

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