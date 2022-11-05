import 'package:algoriza_internship_task1/controller/register_controller.dart';
import 'package:algoriza_internship_task1/models/user_model.dart';
import 'package:algoriza_internship_task1/resources/assets_manager.dart';
import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:algoriza_internship_task1/views/widgets/build_button.dart';
import 'package:algoriza_internship_task1/views/widgets/build_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  late RegisterController registerController;
  late String email;
  late String password;
  late String phoneNumber;
  String countryCode = '+20';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    registerController = Provider.of<RegisterController>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.asset(ImageAssets.cover, width: double.infinity, height: 110, fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    backgroundColor: ColorManager.black,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: ColorManager.white),
                    )
                  ),
                ),
              ],
            ),
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
                        const Text('Register', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                    const Text('Email', style: TextStyle(color: ColorManager.black54, fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    BuildTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Eg. example@email.com',
                      validator: (val) {
                        if(val!.trim().isEmpty) {return 'Please enter your email';}
                        if(!val.contains('@') || !val.contains('.')) {return 'Invalid email address';}
                        return null;
                      },
                      onSaved: (val) => email = val!,
                    ),
                    const SizedBox(height: 20),
                    const Text('Phone Number', style: TextStyle(color: ColorManager.black54, fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    BuildTextFormField(
                      keyboardType: TextInputType.phone,
                      hintText: 'Eg. 01234567890',
                      validatorMsg: 'Please enter your phone number',
                      isPhone: true,
                      countryCodePickerOnChanged: (val) => countryCode = val.dialCode!,
                      onSaved: (val) => phoneNumber = val!,
                    ),
                    const SizedBox(height: 20),
                    const Text('Password', style: TextStyle(color: ColorManager.black54, fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    Selector<RegisterController, bool>(
                      selector: (context, provider) => provider.isShowPassword,
                      builder: (context, isShowPassword, child) {
                        return BuildTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          isShowPassword: isShowPassword,
                          suffixOnTap: () => Provider.of<RegisterController>(context, listen: false).changeIsShowPassword(),
                          hintText: 'Password',
                          validator: (val) {
                            if(val!.trim().isEmpty) {return 'Please enter your password';}
                            if(val.length < 6) {return 'Password must at least consist of 6 characters';}
                            return null;
                          },
                          onSaved: (val) => password = val!,
                        );
                      }
                    ),
                    const SizedBox(height: 30),
                    BuildButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          UserModel userModel = UserModel(email: email, password: password, phoneNumber: phoneNumber, countryCode: countryCode);
                          registerController.register(context, userModel);
                        }
                      },
                      text: 'Register',
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
                        const Text('Has any account?'),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Sign in here', style: TextStyle(color: ColorManager.blue)),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                        width: double.infinity,
                        child: Text('By registering your account, you are agree to our', textAlign: TextAlign.center, style: TextStyle(color: ColorManager.grey))
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('terms and condition', textAlign: TextAlign.center)
                      ),
                    )
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