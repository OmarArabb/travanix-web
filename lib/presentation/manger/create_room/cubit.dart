import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/repos/create_room_repo.dart';
import 'package:travanix/presentation/manger/create_room/states.dart';

class CreateRoomCubit extends Cubit<CreateRoomStates>{
  CreateRoomCubit() :super(InitialCreateRoomState());

  static CreateRoomCubit get(context) => BlocProvider.of(context);

  final CreateRoomRepo _createRoomRepo = CreateRoomRepo();

  final TextEditingController sizeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future<void> createNewRoom({required int hotelId}) async {
    emit(LoadingCreateRoomState());

    var result = await _createRoomRepo.createHotel(data: {

        "capacity_room": int.parse(sizeController.text),
        "price_room": int.parse(priceController.text),
        "quantity":int.parse(quantityController.text),
        "hotel_id": hotelId

    });

    result.fold((error) {
      emit(ErrorCreateRoomState(errMessage: error.errMessage));
    }, (success) {
      emit(SuccessCreateRoomState(successMessage: success));
    },);

  }

}