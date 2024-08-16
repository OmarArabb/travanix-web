abstract class GetDashBoardStates{}

class InitialGetDashBoard extends GetDashBoardStates{}
class LoadingGetDashBoard extends GetDashBoardStates{}
class SuccessGetDashBoard extends GetDashBoardStates{}
class ErrorGetDashBoard extends GetDashBoardStates{
  final String errMessage;

  ErrorGetDashBoard({required this.errMessage});
}