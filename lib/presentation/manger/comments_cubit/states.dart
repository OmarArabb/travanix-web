abstract class GetCommentsStates{}

class InitialGetComments extends GetCommentsStates{}
class LoadingGetComments extends GetCommentsStates{}
class SuccessGetComments extends GetCommentsStates{}
class ErrorGetComments extends GetCommentsStates{
  final String errMessage;

  ErrorGetComments({required this.errMessage});
}

class LoadingDeleteComments extends GetCommentsStates{}
class SuccessDeleteComments extends GetCommentsStates{
  final String successMessage;

  SuccessDeleteComments({required this.successMessage});
}
class ErrorDeleteComments extends GetCommentsStates{
  final String errMessage;

  ErrorDeleteComments({required this.errMessage});
}