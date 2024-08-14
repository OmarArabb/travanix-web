abstract class GetRoomsStates{}

class InitialGetRoomsState extends GetRoomsStates{}
class LoadingGetRoomsState extends GetRoomsStates{}
class SuccessGetRoomsState extends GetRoomsStates{}
class ErrorGetRoomsState extends GetRoomsStates{

  final String errMessage;

  ErrorGetRoomsState({required this.errMessage});
}