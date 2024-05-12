import 'package:flutter/material.dart';
import 'package:travanix/core/routes/route.dart';
import 'package:travanix/core/styles/theme.dart';

void main() {
  runApp(const Travanix());
}

class Travanix extends StatelessWidget {
  const Travanix({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: themeData,
    );
  }
}




