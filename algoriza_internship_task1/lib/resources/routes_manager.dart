import 'package:algoriza_internship_task1/views/screens/home_screen.dart';
import 'package:algoriza_internship_task1/views/screens/login_screen.dart';
import 'package:algoriza_internship_task1/views/screens/on_boarding_screen.dart';
import 'package:algoriza_internship_task1/views/screens/register_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onBoardingRoute = '/OnBoardingScreen';
  static const String loginRoute = '/LoginScreen';
  static const String registerRoute = '/RegisterScreen';
  static const String homeRoute = '/HomeScreen';
}

PageRouteBuilder onGenerateRoute (routeSettings) {
  return PageRouteBuilder(
    settings: routeSettings,
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (routeSettings.name) {
        case Routes.loginRoute: return LoginScreen();
        case Routes.registerRoute: return RegisterScreen();
        case Routes.homeRoute: return const HomeScreen();
        default: return OnBoardingScreen();
      }
    }
  );
}