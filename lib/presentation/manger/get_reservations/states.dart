abstract class GetReservationsStates{}

class InitialGetReservationState extends GetReservationsStates{}

class ChangeIndex extends GetReservationsStates{}

class RemoveItemFromReservations extends GetReservationsStates{}

class LoadingGetTripReservationsState extends GetReservationsStates{}

class SuccessGetTripReservationsState extends GetReservationsStates{}

class ErrorGetTripReservationsState extends GetReservationsStates{
  final String errMessage;

  ErrorGetTripReservationsState({required this.errMessage});
}



class LoadingGetHotelReservationsState extends GetReservationsStates{}

class SuccessGetHotelReservationsState extends GetReservationsStates{}

class ErrorGetHotelReservationsState extends GetReservationsStates{
  final String errMessage;

  ErrorGetHotelReservationsState({required this.errMessage});
}


class LoadingEditReservationsState extends GetReservationsStates{}

class SuccessEditReservationsState extends GetReservationsStates{
  final String successMessage;

  SuccessEditReservationsState({required this.successMessage});
}

class ErrorEditReservationsState extends GetReservationsStates{
  final String errMessage;

  ErrorEditReservationsState({required this.errMessage});
}