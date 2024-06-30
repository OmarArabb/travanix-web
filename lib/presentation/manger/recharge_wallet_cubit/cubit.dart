import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/recharge_wallet_model/recharge_wallet_model.dart';
import 'package:travanix/data/repos/recharge_wallet_repo.dart';
import 'package:travanix/presentation/manger/recharge_wallet_cubit/states.dart';

class RechargeWalletCubit extends Cubit<RechargeWalletStates> {
  RechargeWalletCubit() : super(InitialGetRequestState());

  static RechargeWalletCubit get(context) => BlocProvider.of(context);

  int? id;
  bool? status;
  int? amount;

  final RechargeWalletRepo rechargeWalletRepo = RechargeWalletRepo();

  RechargeWalletModel? model;
  List<Data>? requests= [];

  Future<void> getRequestToRecharge() async {
    emit(LoadingGetRequestState());
    var result = await rechargeWalletRepo.getRequestToRecharge();
    result.fold((error) {
      emit(ErrorGetRequestState(errMessage: error.errMessage));
    }, (model) {

        int length = model.data!.length;
        for (int i = 0; i < length; i++) {
          if (model.data![i].status == 1) {
              requests!.add(model.data![i]);
          }
        }
        this.model = model;

        emit(SuccessGetRequestState());

    });
  }

  Future<void> rechargeWallet() async {
    emit(LoadingRechargeWalletState());
    var result = await rechargeWalletRepo.rechargeWallet(
      id: id!,
      status: status!,
      amount: amount!,
    );
    result.fold((error) {
      emit(ErrorRechargeWalletState(errMessage: error.errMessage));
    }, (message) {
      emit(SuccessRechargeWalletState(successMessage: message));
    });
  }



}
