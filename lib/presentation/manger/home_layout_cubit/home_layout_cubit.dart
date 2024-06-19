import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/failures.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/data/models/create_item_model/country_model.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{

  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  CountryModel? countryModel;

  void getCountry() async {
    emit(LoadingGetCountryState());
    ApiService.get(endPoint: 'adminGetAllNations').then((value) {
      countryModel = CountryModel.fromJson(value);
      emit(SuccessGetCountryState());
    }).catchError((error){
      emit(ErrorGetCountryState(errorMessage: error.toString()));
      ServerFailure(error.toString());
    });

  }

  void changeIndex (int index,BuildContext context){
    currentIndex = index;
    emit(HomeLayoutChangeIndexState());
  }
}