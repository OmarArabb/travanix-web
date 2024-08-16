abstract class DeleteItemStates{}

class InitialDeleteItemState extends DeleteItemStates{}

class LoadingDeleteItemState extends DeleteItemStates{}

class SuccessDeleteItemState extends DeleteItemStates{
  final String successMessage;

  SuccessDeleteItemState({required this.successMessage});
}

class ErrorDeleteItemState extends DeleteItemStates{
  final String errorMessage;

  ErrorDeleteItemState({required this.errorMessage});
}