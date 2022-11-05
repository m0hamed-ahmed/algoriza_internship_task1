import 'package:algoriza_internship_task1/controller/login_controller.dart';
import 'package:algoriza_internship_task1/resources/assets_manager.dart';
import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:algoriza_internship_task1/resources/routes_manager.dart';
import 'package:algoriza_internship_task1/views/widgets/build_button.dart';
import 'package:algoriza_internship_task1/views/widgets/build_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  late LoginController loginController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loginController = Provider.of<LoginController>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(ImageAssets.cover, width: double.infinity, height: 250, fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome to Fashion Daily', style: TextStyle(color: ColorManager.black54, fontSize: 15)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sign in', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text('Help', style: TextStyle(color: ColorManager.blue, fontSize: 16)),
                                SizedBox(width: 5),
                                Icon(Icons.help, color: ColorManager.blue)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text('Phone Number', style: TextStyle(color: ColorManager.black54, fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    BuildTextFormField(
                      keyboardType: TextInputType.phone,
                      hintText: 'Eg. 01234567890',
                      validator: (val) {
                        if(val!.trim().isEmpty) {return 'Please enter your phone number';}
                        if(!loginController.isUserFound(val)) {return 'Phone number is not registered.';}
                        return null;
                      },
                      isPhone: true,
                    ),
                    const SizedBox(height: 30),
                    BuildButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          loginController.login(context);
                        }
                      },
                      text: 'Sign In',
                      buttonColor: ColorManager.blue,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        SizedBox(width: 5),
                        Text('Or', style: TextStyle(color: ColorManager.grey)),
                        SizedBox(width: 5),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    BuildButton(
                      onPressed: () {},
                      text: 'Sign with by google',
                      buttonColor: ColorManager.white,
                      borderColor: ColorManager.blue,
                      image: ImageAssets.googleIc,
                      textColor: ColorManager.blue,
                      elevation: 0,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Doesn't has any account?"),
                        TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child: const Text('Register here', style: TextStyle(color: ColorManager.blue)),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                        width: double.infinity,
                        child: Text('Use the application according to policy rules. Any kinds of violations will be subject to sanctions.', textAlign: TextAlign.center, style: TextStyle(color: ColorManager.grey))
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}