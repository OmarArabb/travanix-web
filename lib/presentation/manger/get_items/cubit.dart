import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/attractions_model/attractions_model.dart';
import 'package:travanix/data/models/hotels_model/hotel_model.dart';
import 'package:travanix/data/models/restaurants_model/restaurants_model.dart';
import 'package:travanix/data/repos/get_item_by_id_repo.dart';
import 'package:travanix/data/repos/get_items_repo.dart';
import 'package:travanix/presentation/manger/get_items/states.dart';

class GetItemsCubit extends Cubit<GetItemStates> {

  GetItemsCubit() : super(InitialGetItemState());

  static GetItemsCubit get(context) => BlocProvider.of(context);

  final GetItemsRepo  _getItemsRepo = GetItemsRepo();
  final GetItemByIdRepo _getItemByIdRepo = GetItemByIdRepo();

  HotelModel? hotelsModel;
  RestaurantsModel? restaurantsModel;
  AttractionsModel? attractionsModel;

  int currIndex = -1 ;

  void changeCurrIndex(int index){
    currIndex = currIndex == index ? -1 : index;
    emit(ChangeCurrentIndexOfTabBar());
  }


  Future<void> getHotels() async{

    emit(GetHotelsLoadingState());
    var result = await _getItemsRepo.getHotels();

    result.fold((error){
      emit(GetHotelsErrorState(errMessage: error.errMessage));
    }, (hotelsModel){
      this.hotelsModel = hotelsModel;
      emit(GetHotelsSuccessState());
    });

  }

  Future<void> getRestaurants() async{

    emit(GetRestaurantsLoadingState());
    var result = await _getItemsRepo.getRestaurants();

    result.fold((error){
      emit(GetRestaurantsErrorState(errMessage: error.errMessage));
    }, (restaurantsModel){
      this.restaurantsModel = restaurantsModel;
      emit(GetRestaurantsSuccessState());
    });

  }

  Future<void> getAttractions() async{

    emit(GetAttractionsLoadingState());
    var result = await _getItemsRepo.getAttractions();

    result.fold((error){
      emit(GetAttractionsErrorState(errMessage: error.errMessage));
    }, (attractionsModel){
      this.attractionsModel = attractionsModel;
      emit(GetAttractionsSuccessState());
    });

  }

  Future<void> getHotelById({required int id}) async{

    emit(GetHotelsLoadingState());
    var result = await _getItemByIdRepo.getHotelsById(id: id);

    result.fold((error){
      emit(GetHotelsErrorState(errMessage: error.errMessage));
    }, (hotelsModel){
      this.hotelsModel = hotelsModel;
      emit(GetHotelsSuccessState());
    });

  }

  Future<void> getRestaurantById({required int id}) async{

    emit(GetRestaurantsLoadingState());
    var result = await _getItemByIdRepo.getRestaurantsById(id: id);

    result.fold((error){
      emit(GetRestaurantsErrorState(errMessage: error.errMessage));
    }, (restaurantsModel){
      this.restaurantsModel = restaurantsModel;
      emit(GetRestaurantsSuccessState());
    });

  }

  Future<void> getAttractionById({required int id}) async{

    emit(GetAttractionsLoadingState());
    var result = await _getItemByIdRepo.getAttractionsById(id: id);

    result.fold((error){
      print(error.errMessage);
      emit(GetAttractionsErrorState(errMessage: error.errMessage));
    }, (attractionsModel){
      // print(attractionsModel.data![0].description);
      this.attractionsModel = attractionsModel;
      emit(GetAttractionsSuccessState());
    });

  }

}