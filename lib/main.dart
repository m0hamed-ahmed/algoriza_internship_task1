import 'package:algoriza_internship_task1/controller/login_controller.dart';
import 'package:algoriza_internship_task1/controller/on_boarding_controller.dart';
import 'package:algoriza_internship_task1/controller/register_controller.dart';
import 'package:algoriza_internship_task1/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'resources/color_manager.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => RegisterController())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Algoriza internship task 1',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.white,
      ),
      onGenerateRoute: (routeSettings) => onGenerateRoute(routeSettings),
    );
  }
}