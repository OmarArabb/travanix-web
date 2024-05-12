import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/routes/route.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/views/login/secret_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obscureText = ValueNotifier(true);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      backgroundColor: seaShellPeach,
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: greyColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      prefixIcon: Icons.alternate_email,
                      controller: emailController,
                      text: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email';
                        }
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SecretTextFormField(
                    controller: passwordController,
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
                CustomMaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AppRouter.canExitFromLoginScreen = true;
                      context.goNamed(AppRouter.homeRouteName);
                    } else {
                    }
                  },
                  formKey: formKey,
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
