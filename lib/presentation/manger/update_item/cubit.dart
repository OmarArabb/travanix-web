import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/create_item_model/cities_model.dart';
import 'package:travanix/data/models/trip_model/TripModel.dart';
import 'package:travanix/data/repos/create_item_repo.dart';
import 'package:travanix/data/repos/update_item_repo.dart';
import 'package:travanix/presentation/manger/update_item/states.dart';

class UpdateItemCubit extends Cubit<UpdateItemStates>{
  UpdateItemCubit({required TripModel model}) : super(InitialUpdateItemState()){
    nameController.text = model.data!.tripName!;
    priceController.text = model.data!.priceTrip!.toString();
    numberOfSeatController.text = model.data!.numberOfAllSeat.toString();
    aboutController.text = model.data!.description!;
    addressController.text = model.data!.address!;
    openingTimeController.text = model.data!.tripStartTime!;
    closingTimeController.text = model.data!.tripEndTime!;
    coordinateXController.text = model.data!.coordinateX.toString();
    coordinateYController.text = model.data!.coordinateY.toString();
    cityId = model.data!.cityId!;
    countryId = model.data!.nationId!;
    tripId = model.data!.id!;
    for (var element in model.data!.places!) {
      if(element.hotelId != null){
        selectedHotels.add(element.hotelId!);
      }else if(element.restaurantId != null){
        selectedRestaurants.add(element.restaurantId!);
      }else if(element.attractionActivityId != null){
        selectedAttractions.add(element.attractionActivityId!);
      }
    }


  }

  static UpdateItemCubit get(context) => BlocProvider.of(context);

  CitiesModel? citiesModel;

  final UpdateItemRepo _updateItemRepo = UpdateItemRepo();
  final CreateItemRepo _createItemRepo = CreateItemRepo();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController numberOfSeatController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();
  TextEditingController coordinateXController = TextEditingController();
  TextEditingController coordinateYController = TextEditingController();

  List<int> selectedHotels = [];
  List<int> selectedRestaurants = [];
  List<int> selectedAttractions = [];
  int countryId = 0;
  int cityId = 0;
  int tripId = 0 ;

  void updateTrip() async {
    emit(LoadingUpdateTripState());

    var result = await _updateItemRepo.updateTrip(data: {
      'trip_id' : tripId,
      "trip_name" : nameController.text,
      "description" : aboutController.text,
      "type_of_trip" :"Family",
      "price_trip" :int.parse(priceController.text),
      "number_of_allSeat" :int.parse(numberOfSeatController.text),
      "trip_start_time" : openingTimeController.text,
      "trip_end_time" : closingTimeController.text,
      "city_id" : cityId,
      "address" : addressController.text,
      "coordinate_x" : double.parse(coordinateXController.text) ,
      "coordinate_y" : double.parse(coordinateYController.text),
      "places":[
        for (int value in selectedHotels) {
          "hotel_id" : value
        },
        for (int value in selectedRestaurants) {
          "resturant_id" : value
        },
        for (int value in selectedAttractions) {
          "attraction_activity_id" : value
        },
      ]
    });

    result.fold((error) {
      emit(ErrorUpdateTripState(errMessage: error.errMessage));
    }, (success){
      emit(SuccessUpdateTripState(successMessage: success));
    });
  }

  Future<void> getCityById(int countryId) async {
    emit(LoadingGetCitiesState());
    var result = await _createItemRepo.getCity(countryId: countryId);
    result.fold(
          (error) {
        emit(ErrorGetCitiesState(errMessage: error.errMessage));
      },
          (citiesModel) {
        this.citiesModel = citiesModel;
        emit(SuccessGetCitiesState());
      },
    );
  }

}