abstract class SearchStates{}

class InitialSearchState extends SearchStates{}

class LoadingSearchState extends SearchStates{}

class SuccessSearchState extends SearchStates{}

class ErrorSearchState extends SearchStates{

  final String errMessage;

  ErrorSearchState({required this.errMessage});
}