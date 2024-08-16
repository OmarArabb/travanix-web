abstract class GetItemStates{}

class InitialGetItemState extends GetItemStates{}

class ChangeCurrentIndexOfTabBar extends GetItemStates{}

class GetHotelsLoadingState extends GetItemStates{}

class GetHotelsSuccessState extends GetItemStates{}

class GetHotelsErrorState extends GetItemStates{
  final String errMessage;

  GetHotelsErrorState({required this.errMessage});

}


class GetRestaurantsLoadingState extends GetItemStates{}

class GetRestaurantsSuccessState extends GetItemStates{}

class GetRestaurantsErrorState extends GetItemStates{
  final String errMessage;

  GetRestaurantsErrorState({required this.errMessage});

}


class GetAttractionsLoadingState extends GetItemStates{}

class GetAttractionsSuccessState extends GetItemStates{}

class GetAttractionsErrorState extends GetItemStates{
  final String errMessage;

  GetAttractionsErrorState({required this.errMessage});

}

class GetTripLoadingState extends GetItemStates{}

class GetTripSuccessState extends GetItemStates{}

class GetTripErrorState extends GetItemStates{
  final String errMessage;

  GetTripErrorState({required this.errMessage});

}