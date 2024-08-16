import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/repos/delete_item_repo.dart';
import 'package:travanix/presentation/manger/delete_item_cubit/states.dart';

class DeleteItemCubit extends Cubit<DeleteItemStates>{
  DeleteItemCubit() : super(InitialDeleteItemState());

  static DeleteItemCubit get(context) => BlocProvider.of(context);

  final DeleteItemRepo _deleteItemRepo = DeleteItemRepo();

  void deleteTrip({required int tripId}) async {
    emit(LoadingDeleteItemState());

    var result = await _deleteItemRepo.deleteTrip(tripId: tripId);

    result.fold((error){
      emit(ErrorDeleteItemState(errorMessage: error.errMessage));
    }, (success){
      emit(SuccessDeleteItemState(successMessage: success));
    });
  }
}