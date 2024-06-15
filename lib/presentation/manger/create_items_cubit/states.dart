abstract class CreateItemsStates{}

class InitialCreateItemsState extends CreateItemsStates{}

class SuccessToAddMultiImagesState extends CreateItemsStates{}

class LoadingToAddMultiImagesState extends CreateItemsStates{}

class ErrorToAddMultiImagesState extends CreateItemsStates{
  final String errorMessage;

  ErrorToAddMultiImagesState({required this.errorMessage});

}

class AddSingleImageItemsState extends CreateItemsStates{}

class LoadingGetCountryState extends CreateItemsStates{}
class SuccessGetCountryState extends CreateItemsStates{}
class ErrorGetCountryState extends CreateItemsStates{

  final String errorMessage;

  ErrorGetCountryState({required this.errorMessage});
}

class LoadingGetCitiesState extends CreateItemsStates{}
class SuccessGetCitiesState extends CreateItemsStates{}
class ErrorGetCitiesState extends CreateItemsStates{

  final String errorMessage;

  ErrorGetCitiesState({required this.errorMessage});
}

class LoadingGetServicesState extends CreateItemsStates{}
class SuccessGetServicesState extends CreateItemsStates{}
class ErrorGetServicesState extends CreateItemsStates{

  final String errorMessage;

  ErrorGetServicesState({required this.errorMessage});
}

class LoadingCreateHotelState extends CreateItemsStates{}
class SuccessCreateHotelState extends CreateItemsStates{
  final String successMessage;

  SuccessCreateHotelState({required this.successMessage});
}
class ErrorCreateHotelState extends CreateItemsStates{

  final String errorMessage;

  ErrorCreateHotelState({required this.errorMessage});
}