import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/data/models/login_model/login_model.dart';
import 'package:travanix/data/repos/login_repo.dart';
import 'package:travanix/presentation/manger/login_cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginRepo loginRepo = LoginRepo();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel? model;

  Future<void> login() async {
    emit(LoadingLoginState());
    var result = await loginRepo.login(
        email: emailController.text, password: passwordController.text);
    result.fold(
      (error) {
        emit(ErrorLoginState(error: error.errMessage));
      },
      (model) {
        this.model = model;
        emit(SuccessLoginState());
      },
    );
  }
}
