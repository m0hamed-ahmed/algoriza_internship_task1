import 'package:algoriza_internship_task1/controller/on_boarding_controller.dart';
import 'package:algoriza_internship_task1/data_source/static/on_boarding_data.dart';
import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildIndicator extends StatelessWidget {
  const BuildIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<OnBoardingController, int>(
      selector: (context, provider) => provider.currentPage,
      builder: (context, currentPage, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(onBoardingData.length, (index) => Container(
            margin: const EdgeInsets.only(right: 5),
            width: 20,
            height: 10,
            decoration: BoxDecoration(
              color: currentPage == index ? ColorManager.darkOrange : ColorManager.grey2,
              borderRadius: BorderRadius.circular(10)
            ),
          )),
        );
      }
    );
  }
}