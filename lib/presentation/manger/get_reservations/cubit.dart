import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/hotel_reservations_model/data.dart';
import 'package:travanix/data/models/hotel_reservations_model/hotel_reservations_model.dart';
import 'package:travanix/data/models/trip_reservations_model/trip_reservations_model.dart';
import 'package:travanix/data/models/trip_reservations_model/data.dart';
import 'package:travanix/data/repos/edit_reservation_status_repo.dart';
import 'package:travanix/data/repos/get_reservations.dart';
import 'package:travanix/presentation/manger/get_reservations/states.dart';

class GetReservationsCubit extends Cubit<GetReservationsStates> {
  GetReservationsCubit() : super(InitialGetReservationState());

  static GetReservationsCubit get(context) => BlocProvider.of(context);

  final GetReservationsRepo _getReservationsRepo = GetReservationsRepo();

  final EditReservationStatusRepo _editReservationStatusRepo =
      EditReservationStatusRepo();

  int currentIndex = 0;

  TripReservationsModel? tripReservationsModel;
  List<Data> tripReservations = [];

  HotelReservationsModel? hotelReservationsModel;

  List<HotelReservationData> hotelReservations = [];

  Future<void> changeIndex(int index) async {
    currentIndex = index;
    if (currentIndex == 0) {
      getTripReservations();
    } else if (currentIndex == 1) {
      getHotelReservations();
    }
    emit(ChangeIndex());
  }

  void removeItem(dynamic item) {
    if (item is Data) {
      tripReservations.remove(item);
    } else if (item is HotelReservationData) {
      hotelReservations.remove(item);
    }
    emit(RemoveItemFromReservations());
  }

  void getTripReservations() async {
    emit(LoadingGetTripReservationsState());

    var result = await _getReservationsRepo.getTripReservations();

    result.fold(
      (error) {
        print('${error.errMessage}]]]]]]]]]]]]]]]]');
        emit(ErrorGetTripReservationsState(errMessage: error.errMessage));
      },
      (tripReservationsModel) {
        this.tripReservationsModel = tripReservationsModel;
        tripReservations.clear();
        for (var element in tripReservationsModel.data!) {
          if (element.status == 'Pending') {
            tripReservations.add(element);
          }
        }
        emit(SuccessGetTripReservationsState());
      },
    );
  }

  void editTripReservationStatus(Map<String, dynamic> data) async {
    emit(LoadingEditReservationsState());
    var result = await _editReservationStatusRepo.editTripReservation(data);

    result.fold(
      (error) {
        emit(ErrorEditReservationsState(errMessage: error.errMessage));
      },
      (success) {
        emit(SuccessEditReservationsState(successMessage: success));
      },
    );
  }

  void getHotelReservations() async {
    emit(LoadingGetHotelReservationsState());

    var result = await _getReservationsRepo.getHotelReservations();

    result.fold(
      (error) {
        emit(ErrorGetHotelReservationsState(errMessage: error.errMessage));
      },
      (hotelReservationsModel) {
        this.hotelReservationsModel = hotelReservationsModel;
        hotelReservations.clear();
        for (var element in hotelReservationsModel.data!) {
          if (element.status == 'Pending') {
            hotelReservations.add(element);
          }
        }
        emit(SuccessGetHotelReservationsState());
      },
    );
  }

  void editHotelReservationStatus(Map<String, dynamic> data) async {
    emit(LoadingEditReservationsState());
    var result = await _editReservationStatusRepo.editHotelReservation(data);

    result.fold(
      (error) {
        emit(ErrorEditReservationsState(errMessage: error.errMessage));
      },
      (success) {
        emit(SuccessEditReservationsState(successMessage: success));
      },
    );
  }
}
