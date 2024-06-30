abstract class RechargeWalletStates{}

class InitialGetRequestState extends RechargeWalletStates{}

class LoadingGetRequestState extends RechargeWalletStates{}

class SuccessGetRequestState extends RechargeWalletStates{}

class ErrorGetRequestState extends RechargeWalletStates{

  final String errMessage;

  ErrorGetRequestState({required this.errMessage});
}




class LoadingRechargeWalletState extends RechargeWalletStates{}

class SuccessRechargeWalletState extends RechargeWalletStates{
  final String successMessage;

  SuccessRechargeWalletState({required this.successMessage});
}

class ErrorRechargeWalletState extends RechargeWalletStates{

  final String errMessage;

  ErrorRechargeWalletState({required this.errMessage});
}

