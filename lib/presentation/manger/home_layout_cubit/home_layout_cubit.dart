import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/presentation/manger/home_layout_cubit/home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{

  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex (int index,BuildContext context){
    currentIndex = index;
    emit(HomeLayoutChangeIndexState());
  }
}