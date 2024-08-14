abstract class CreateRoomStates{}

class InitialCreateRoomState extends CreateRoomStates{}
class LoadingCreateRoomState extends CreateRoomStates{}
class SuccessCreateRoomState extends CreateRoomStates{
  final String successMessage;

  SuccessCreateRoomState({required this.successMessage});
}
class ErrorCreateRoomState extends CreateRoomStates{
  final String errMessage;

  ErrorCreateRoomState({required this.errMessage});
}