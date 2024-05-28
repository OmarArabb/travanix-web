abstract class CreateItemsStates{}

class InitialCreateItemsState extends CreateItemsStates{}

class SuccessToAddMultiImagesState extends CreateItemsStates{}

class LoadingToAddMultiImagesState extends CreateItemsStates{}

class ErrorToAddMultiImagesState extends CreateItemsStates{
  final String errorMessage;

  ErrorToAddMultiImagesState({required this.errorMessage});

}

class AddSingleImageItemsState extends CreateItemsStates{}