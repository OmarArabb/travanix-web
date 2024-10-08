import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/comments_rate_model/comment_model.dart';
import 'package:travanix/data/repos/comment_rate_repo.dart';
import 'package:travanix/presentation/manger/comments_cubit/states.dart';

class GetCommentsCubit extends Cubit<GetCommentsStates>{
  GetCommentsCubit() : super(InitialGetComments());

  static GetCommentsCubit get(context) => BlocProvider.of(context);

  final CommentRateRepo _commentRateRepo = CommentRateRepo();

  CommentModel? model ;

  double avgRate = 0;

  void getHotelComments({required String endPoint})async{
    emit(LoadingGetComments());
    var result = await _commentRateRepo.getReviews(endPoint: endPoint);

    result.fold((error) {
      print(error.errMessage);
        emit(ErrorGetComments(errMessage: error.errMessage));
    }, (model) {
      this.model = model;
      emit(SuccessGetComments());
    },);

  }


  void deleteComment({required int commentId})async{
    emit(LoadingDeleteComments());
    var result = await _commentRateRepo.deleteComment(commentId: commentId);

    result.fold((error) {
      print(error.errMessage);
        emit(ErrorDeleteComments(errMessage: error.errMessage));
    }, (success) {
      model!.data!.removeWhere((element) =>element.commentId == commentId,);
      emit(SuccessDeleteComments(successMessage: success));
    },);
  }
}