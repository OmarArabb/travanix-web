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

class LoadingCreateRestaurantState extends CreateItemsStates{}
class SuccessCreateRestaurantState extends CreateItemsStates{
  final String successMessage;

  SuccessCreateRestaurantState({required this.successMessage});
}
class ErrorCreateRestaurantState extends CreateItemsStates{

  final String errorMessage;

  ErrorCreateRestaurantState({required this.errorMessage});
}

class LoadingCreateTouristDisState extends CreateItemsStates{}
class SuccessCreateTouristDisState extends CreateItemsStates{
  final String successMessage;

  SuccessCreateTouristDisState({required this.successMessage});
}
class ErrorCreateTouristDisState extends CreateItemsStates{

  final String errorMessage;

  ErrorCreateTouristDisState({required this.errorMessage});
}

class LoadingCreateTripState extends CreateItemsStates{}
class SuccessCreateTripState extends CreateItemsStates{
  final String successMessage;

  SuccessCreateTripState({required this.successMessage});
}
class ErrorCreateTripState extends CreateItemsStates{

  final String errorMessage;

  ErrorCreateTripState({required this.errorMessage});
}