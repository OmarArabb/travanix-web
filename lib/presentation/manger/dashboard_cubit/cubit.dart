import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/dashboard_data/DashBoardModel.dart';
import 'package:travanix/data/repos/dashboard_repo.dart';
import 'package:travanix/presentation/manger/dashboard_cubit/states.dart';

class GetDashBoardCubit extends Cubit<GetDashBoardStates>{
  GetDashBoardCubit() :super(InitialGetDashBoard());

  static GetDashBoardCubit get(context) => BlocProvider.of(context);

  final DashboardRepo _dashboardRepo = DashboardRepo();
  DashBoardModel? dashBoardModel;

  void getDashBoard() async {
    emit(LoadingGetDashBoard());
    var result = await _dashboardRepo.getDashBoard();

    result.fold((error){
      emit(ErrorGetDashBoard(errMessage: error.errMessage));
    }, (model){
      dashBoardModel = model;
      emit(SuccessGetDashBoard());
    });
  }
}