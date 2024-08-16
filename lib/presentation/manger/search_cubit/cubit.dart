import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/search_hotels_model/search_hotels_model.dart';
import 'package:travanix/data/models/search_restaurants_model/search_restaurants_model.dart';
import 'package:travanix/data/models/search_tourist_dis_model/search_tourist_dis_model.dart';
import 'package:travanix/data/models/search_trips_model/search_trip_model.dart';
import 'package:travanix/data/repos/search_repo.dart';
import 'package:travanix/presentation/manger/search_cubit/states.dart';

class SearchCubit extends Cubit<SearchStates>{

  SearchCubit() : super(InitialSearchState());

  static SearchCubit get(context) => BlocProvider.of(context);

  final SearchRepo _searchRepo = SearchRepo();

  SearchHotelsModel? searchHotelsModel;
  SearchRestaurantsModel? searchRestaurantsModel;
  SearchTouristDisModel? searchTouristDisModel;
  TripsModel? tripsModel;

  TextEditingController hotelSearchController = TextEditingController();
  TextEditingController restaurantSearchController = TextEditingController();
  TextEditingController touristDisSearchController = TextEditingController();

  Future<void> searchHotels() async{

    emit(LoadingSearchState());
    var result = await _searchRepo.searchHotels(
      parameters: {
        'name' : hotelSearchController.text
      }
    );

    result.fold((error){
      emit(ErrorSearchState(errMessage: error.errMessage));
    }, (searchHotelsModel){
      this.searchHotelsModel = searchHotelsModel;
      emit(SuccessSearchState());
    });

  }

  Future<void> searchRestaurants() async{

    emit(LoadingSearchState());
    var result = await _searchRepo.searchRestaurants(
        parameters: {
          'name' : restaurantSearchController.text
        }
    );

    result.fold((error){
      emit(ErrorSearchState(errMessage: error.errMessage));
    }, (searchRestaurantsModel){
      this.searchRestaurantsModel = searchRestaurantsModel;
      emit(SuccessSearchState());
    });

  }

  Future<void> searchAttractions() async{

    emit(LoadingSearchState());
    var result = await _searchRepo.searchTouristDis(
        parameters: {
          'name' : touristDisSearchController.text
        }
    );

    result.fold((error){
      emit(ErrorSearchState(errMessage: error.errMessage));
    }, (searchTouristDisModel){
      this.searchTouristDisModel = searchTouristDisModel;
      emit(SuccessSearchState());
    });

  }

  Future<void> searchPlans() async{

    emit(LoadingSearchState());
    var result = await _searchRepo.searchTrip(
        parameters: {
          'name' : restaurantSearchController.text
        }
    );

    result.fold((error){
      emit(ErrorSearchState(errMessage: error.errMessage));
    }, (tripModel){
      this.tripsModel = tripModel;
      emit(SuccessSearchState());
    });

  }



}