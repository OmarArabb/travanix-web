import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travanix/data/models/create_item_model/cities_model.dart';
import 'package:travanix/data/models/create_item_model/country_model.dart';
import 'package:travanix/data/models/create_item_model/services_model.dart';
import 'package:travanix/data/repos/create_item_repo.dart';
import 'package:travanix/presentation/manger/create_items_cubit/states.dart';

class CreateItemsCubit extends Cubit<CreateItemsStates> {
  CreateItemsCubit() : super(InitialCreateItemsState());

  static CreateItemsCubit get(context) => BlocProvider.of(context);

  CreateItemRepo createItemRepo = CreateItemRepo();

  CountryModel? countryModel;

  CitiesModel? citiesModel;

  ServicesModel? servicesModel;

  List<String>? decodedImages = [];

  List<XFile> pickedImages = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();
  TextEditingController coordinateXController = TextEditingController();
  TextEditingController coordinateYController = TextEditingController();

  String? foodType ;
  int rate = 0;
  int countryId = 0;
  int cityId = 0;
  List<int> selectedFacilities = [];

  Future<void> pickAndEncodeMultiImages() async {
    try {
      pickedImages = await ImagePicker().pickMultiImage();
      emit(LoadingToAddMultiImagesState());
      decodedImages!.clear();
      for (XFile file in pickedImages) {
        decodedImages!.add(base64Encode(await file.readAsBytes()));
      }
      emit(SuccessToAddMultiImagesState());
    } on Exception catch (e) {
      emit(ErrorToAddMultiImagesState(errorMessage: e.toString()));
    }
  }

  Future<void> pickAndEncodeSingleImage(int index) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    decodedImages?[index] = base64Encode(await file!.readAsBytes());
    emit(AddSingleImageItemsState());
  }

  Future<void> getCityById(int countryId) async {
    emit(LoadingGetCitiesState());
    var result = await createItemRepo.getCity(countryId: countryId);
    result.fold(
          (error) {
        emit(ErrorGetCitiesState(errorMessage: error.errMessage));
      },
          (citiesModel) {
        this.citiesModel = citiesModel;
        emit(SuccessGetCitiesState());
      },
    );
  }

  Future<void> getServices() async {
    emit(LoadingGetServicesState());
    var result = await createItemRepo.getServices();
    result.fold(
          (error) {
        emit(ErrorGetServicesState(errorMessage: error.errMessage));
      },
          (servicesModel) {
        this.servicesModel = servicesModel;
        emit(SuccessGetServicesState());
      },
    );
  }

  Future<void> createHotel() async {

    emit(LoadingCreateHotelState());

    var result = await createItemRepo.createHotel(data: {
      "hotel_name" :nameController.text,
      "simple_description_about_hotel" : aboutController.text,
      "reviews_about_hotel": "ddddd",
      "hotel_class": rate,
      "phone_number": phoneNumberController.text,
      "city_id" : cityId.toString(),
      "address" : addressController.text,
      "coordinate_x" : double.parse(coordinateXController.text),
      "coordinate_y" : double.parse(coordinateYController.text),
      "images" :decodedImages,
      "services" : selectedFacilities.map((e) {
        return {"service_id" : e};
      }).toList()
    });

    result.fold((error) {
      emit(ErrorCreateHotelState(errorMessage: error.errMessage));
    }, (message) {
      emit(SuccessCreateHotelState(successMessage:  message));
    });
  }

  Future<void> createRestaurant() async {

    emit(LoadingCreateRestaurantState());

    var result = await createItemRepo.createRestaurant(data: {
      "resturant_name" :nameController.text,
      "type_of_food" : foodType,
      "city_id" : cityId.toString(),
      "address" :addressController.text,
      "coordinate_x" : double.parse(coordinateXController.text),
      "coordinate_y" : double.parse(coordinateYController.text),
      "closing_time" : closingTimeController.text,
      "opining_time" : openingTimeController.text,
      "phone_number" : phoneNumberController.text,
      "descreption" : aboutController.text,
      "resturant_class" : 1,
      "images": decodedImages
    });

    result.fold((error) {
      emit(ErrorCreateRestaurantState(errorMessage: error.errMessage));
    }, (message) {
      emit(SuccessCreateRestaurantState(successMessage:  message));
    });
  }

  Future<void> createTouristDis() async {

    emit(LoadingCreateTouristDisState());

    var result = await createItemRepo.createTouristDis(data: {
      "attraction_activity_name" : nameController.text,
      "opening_time" : openingTimeController.text,
      "closing_time" : closingTimeController.text,
      "description" : aboutController.text,
      "city_id" : cityId.toString(),
      "address" : addressController.text,
      "coordinate_x" : double.parse(coordinateXController.text),
      "coordinate_y" : double.parse(coordinateYController.text),
      "images": decodedImages
    });

    result.fold((error) {
      emit(ErrorCreateTouristDisState(errorMessage: error.errMessage));
    }, (message) {
      emit(SuccessCreateTouristDisState(successMessage:  message));
    });
  }
}
