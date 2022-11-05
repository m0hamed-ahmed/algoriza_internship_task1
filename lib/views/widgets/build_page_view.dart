import 'package:algoriza_internship_task1/controller/on_boarding_controller.dart';
import 'package:algoriza_internship_task1/data_source/static/on_boarding_data.dart';
import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BuildPageView extends StatelessWidget {
  late OnBoardingController onBoardingController;

  BuildPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onBoardingController = Provider.of<OnBoardingController>(context, listen: false);

    return Selector<OnBoardingController, PageController>(
      selector: (context, provider) => provider.pageController,
      builder: (context, pageController, child) {
        return PageView.builder(
          controller: pageController,
          onPageChanged: (index) => onBoardingController.onPageChanged(index),
          itemCount: onBoardingData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Center(child: Image.asset(onBoardingData[index].image, width: 300, height: 300))),
                  Column(
                    children: [
                      Text(onBoardingData[index].title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Text(onBoardingData[index].description, textAlign: TextAlign.center, style: const TextStyle(color: ColorManager.grey, fontSize: 18)),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  void onPageChanged(int index) {

  }
}