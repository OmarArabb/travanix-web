abstract class UpdateItemStates{}

class InitialUpdateItemState extends UpdateItemStates{}

class LoadingUpdateTripState extends UpdateItemStates{}
class SuccessUpdateTripState extends UpdateItemStates{
  final String successMessage;

  SuccessUpdateTripState({required this.successMessage});
}
class ErrorUpdateTripState extends UpdateItemStates{
  final String errMessage;

  ErrorUpdateTripState({required this.errMessage});
}


class LoadingGetCitiesState extends UpdateItemStates{}
class SuccessGetCitiesState extends UpdateItemStates{}
class ErrorGetCitiesState extends UpdateItemStates{
  final String errMessage;

  ErrorGetCitiesState({required this.errMessage});

}