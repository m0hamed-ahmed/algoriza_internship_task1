import 'package:algoriza_internship_task1/data_source/static/on_boarding_data.dart';
import 'package:algoriza_internship_task1/resources/constants_manager.dart';
import 'package:algoriza_internship_task1/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingController with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  setCurrentPage(int index) => _currentPage = index;
  onPageChanged(int index) {_currentPage = index; notifyListeners();}

  late PageController _pageController;
  PageController get pageController => _pageController;

  init() {
    _pageController = PageController();
  }

  next(BuildContext context) async {
    _currentPage++;
    if(currentPage > onBoardingData.length - 1) {
      skip(context);
    }
    else {
      _pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: ConstantsManager.changePageViewDuration), curve: Curves.easeInOut);
    }
  }

  skip(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (route) => false);
  }
}