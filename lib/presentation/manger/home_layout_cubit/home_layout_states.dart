abstract class HomeLayoutStates{}

class HomeLayoutInitialState extends HomeLayoutStates{}

class HomeLayoutChangeIndexState extends HomeLayoutStates{}

class LoadingGetCountryState extends HomeLayoutStates{}
class SuccessGetCountryState extends HomeLayoutStates{}
class ErrorGetCountryState extends HomeLayoutStates{

  final String errorMessage;

  ErrorGetCountryState({required this.errorMessage});
}