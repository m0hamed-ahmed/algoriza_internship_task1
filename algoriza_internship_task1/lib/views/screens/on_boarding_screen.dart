import 'package:algoriza_internship_task1/controller/on_boarding_controller.dart';
import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:algoriza_internship_task1/views/widgets/build_button.dart';
import 'package:algoriza_internship_task1/views/widgets/build_indicator.dart';
import 'package:algoriza_internship_task1/views/widgets/build_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  late OnBoardingController onBoardingController;

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onBoardingController = Provider.of<OnBoardingController>(context, listen: false);

    onBoardingController.init();

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
        backgroundColor: ColorManager.white,
        elevation: 0,
        title: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: InkWell(
            onTap: () => onBoardingController.skip(context),
            borderRadius: BorderRadius.circular(20),
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: ColorManager.lightOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('Skip', style: TextStyle(color: ColorManager.black, fontSize: 16)),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: '7', style: TextStyle(color: ColorManager.darkOrange, fontSize: 35, fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Krave', style: TextStyle(color: ColorManager.teal, fontSize: 35, fontWeight: FontWeight.bold)),
                ]
              )
            ),
            const SizedBox(height: 20),
            Expanded(child: BuildPageView()),
            const SizedBox(height: 20),
            const BuildIndicator(),
            const SizedBox(height: 20),
            Selector<OnBoardingController, int>(
              selector: (context, provider) => provider.currentPage,
              builder: (context, currentPage, child) {
                return BuildButton(
                  onPressed: () => onBoardingController.next(context),
                  text: currentPage == 0 ? 'Next' : 'Get Started',
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?", style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {},
                  child: const Text('Sign Up', style: TextStyle(color: ColorManager.teal, fontSize: 16)),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}