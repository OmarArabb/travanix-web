import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/bloc_observer.dart';
import 'package:travanix/core/functions/api_services.dart';
import 'package:travanix/core/routes/route.dart';
import 'package:travanix/core/styles/theme.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiService.init();

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




