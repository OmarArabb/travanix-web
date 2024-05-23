import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/generated/assets.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';

class ErrorRoutingPage extends StatelessWidget {
  const ErrorRoutingPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.images404),
        CustomMaterialButton(child: const Text('Go to home page'), onPressed: (){
          context.go('/home');
        },),
      ],
    );
  }
}
