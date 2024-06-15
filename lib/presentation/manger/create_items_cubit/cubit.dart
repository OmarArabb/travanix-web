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

  Future<void> getCountry() async {
    emit(LoadingGetCountryState());
    var result = await createItemRepo.getCountry();
    result.fold(
          (error) {
        emit(ErrorGetCountryState(errorMessage: error.errMessage));
      },
          (countryModel) {
        this.countryModel = countryModel;
        emit(SuccessGetCountryState());
      },
    );
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
            print(error.errMessage);
        emit(ErrorGetServicesState(errorMessage: error.errMessage));
      },
          (servicesModel) {
        this.servicesModel = servicesModel;
        emit(SuccessGetServicesState());
      },
    );
  }

  Future<void> createHotel()async{

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
      print(error.errMessage);
      emit(ErrorCreateHotelState(errorMessage: error.errMessage));
    }, (message) {
      print(message);
      emit(SuccessCreateHotelState(successMessage:  message));
    });
  }
}
