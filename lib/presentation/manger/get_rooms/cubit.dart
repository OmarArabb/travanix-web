import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/rooms_model/rooms_model.dart';
import 'package:travanix/data/repos/get_rooms.dart';
import 'package:travanix/presentation/manger/get_rooms/states.dart';

class GetRoomsCubit extends Cubit<GetRoomsStates> {
  GetRoomsCubit() : super(InitialGetRoomsState());

  static GetRoomsCubit get(context) => BlocProvider.of(context);
  final GetRoomsRepo _getRoomsRepo = GetRoomsRepo();
  RoomsModel? roomsModel;

  void getRooms({required int hotelId}) async {
    emit(LoadingGetRoomsState());

    var result = await _getRoomsRepo.getRooms(hotelId: hotelId);
    result.fold(
      (error) {
        emit(ErrorGetRoomsState(errMessage: error.errMessage));
      },
      (roomsModel) {
        this.roomsModel = roomsModel;
        emit(SuccessGetRoomsState());
      },
    );
  }
}
