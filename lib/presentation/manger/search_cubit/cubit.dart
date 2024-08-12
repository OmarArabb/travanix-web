import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/search_hotels_model/search_hotels_model.dart';
import 'package:travanix/data/repos/search_repo.dart';
import 'package:travanix/presentation/manger/search_cubit/states.dart';

class SearchCubit extends Cubit<SearchStates>{

  SearchCubit() : super(InitialSearchState());

  static SearchCubit get(context) => BlocProvider.of(context);

  final SearchRepo _searchRepo = SearchRepo();

  SearchHotelsModel? searchHotelsModel;


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

}