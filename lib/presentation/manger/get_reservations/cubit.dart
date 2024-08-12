import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/trip_reservations_model/trip_reservations_model.dart';
import 'package:travanix/data/models/trip_reservations_model/data.dart';
import 'package:travanix/data/repos/edit_reservation_status_repo.dart';
import 'package:travanix/data/repos/get_reservations.dart';
import 'package:travanix/presentation/manger/get_reservations/states.dart';

class GetReservationsCubit extends Cubit<GetReservationsStates>{
  GetReservationsCubit() : super(InitialGetReservationState());

  static GetReservationsCubit get(context) => BlocProvider.of(context);

  final GetReservationsRepo _getReservationsRepo = GetReservationsRepo();

  final EditReservationStatusRepo _editReservationStatusRepo = EditReservationStatusRepo();

  int currentIndex = 0;

  TripReservationsModel? tripReservationsModel;
  List<Data> model = [];

  Future<void> changeIndex(int index) async {
    currentIndex = index;
    emit(ChangeIndex());
  }

  void removeItem(Data item){
    model.remove(item);
    emit(RemoveItemFromReservations());
  }

  void getTripReservations() async {
    emit(LoadingGetTripReservationsState());

    var result = await  _getReservationsRepo.getTripReservations();

    result.fold((error) {
      print('${error.errMessage}]]]]]]]]]]]]]]]]');
        emit(ErrorGetTripReservationsState(errMessage: error.errMessage));
    },(tripReservationsModel) {
      this.tripReservationsModel = tripReservationsModel;
      for (var element in tripReservationsModel.data!) {
        if(element.status == 'Pending'){
          model.add(element);
        }
      }
      emit(SuccessGetTripReservationsState());
    }, );
  }

  void editTripReservationStatus(Map<String,dynamic> data)async {
    emit(LoadingEditReservationsState());
    var result = await _editReservationStatusRepo.editTripReservation(data);

    result.fold((error) {
      emit(ErrorEditReservationsState(errMessage: error.errMessage));
    },(success) {
      emit(SuccessEditReservationsState(successMessage: success));
    },);
  }



}