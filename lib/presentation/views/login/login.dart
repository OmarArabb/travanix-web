import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/constant.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/generated/assets.dart';
import 'package:travanix/core/routes/route.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/login_cubit/cubit.dart';
import 'package:travanix/presentation/manger/login_cubit/states.dart';
import 'package:travanix/presentation/views/login/widgets/secret_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obscureText = ValueNotifier(true);
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is ErrorLoginState) {
            errorToast(state.error);
          } else if (state is SuccessLoginState &&
              LoginCubit.get(context).model!.status == 0) {
            errorToast(LoginCubit.get(context).model!.message!);
          } else if (state is SuccessLoginState &&
              LoginCubit.get(context).model!.status == 1) {
            successToast(LoginCubit.get(context).model!.message!);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: seaShellPeach,
            body: Form(
              key: formKey,
              child: Center(
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    // borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: greyColor),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            Assets.imagesLogo,
                            color: basicColor,
                            height: 125,
                            width: 125,
                            fit: BoxFit.cover,
                          )),
                      const Text(
                        'T R A V A N I X',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Please log in for continue ...',
                            style: TextStyle(color: greyColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: CustomTextFormField(
                          focusedBorder: buildOutlineInputBorder(),
                          prefixIcon: Icons.alternate_email,
                          controller: cubit.emailController,
                          text: 'Email',
                          validator: validateEmail,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SecretTextFormField(
                          focusedBorder: buildOutlineInputBorder(),
                          controller: cubit.passwordController,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.remove_red_eye_rounded,
                          obscureText: obscureText,
                          text: 'Password',
                          onPressedSuffixIcon: () {
                            obscureText.value = !obscureText.value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      if(state is !LoadingLoginState)
                      CustomMaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login().then(
                              (value) {
                                if (cubit.model!.status == 1) {
                                  taken = cubit.model!.accessToken!;
                                  print('========================= ${cubit.model!.accessToken}');
                                  AppRouter.canExitFromLoginScreen = true;
                                  context.goNamed(AppRouter.homeRouteName);
                                  AppRouter.canExitFromLoginScreen = false;

                                }
                              },
                            );
                          } else {}
                        },
                        formKey: formKey,
                        child: const Text(
                          'Log in',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      if(state is LoadingLoginState)
                        const CircularProgressIndicator(),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: basicColor,
      ),
    );
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Please Enter Your Email';
    }

    return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
}
