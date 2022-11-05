import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final String? validatorMsg;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function()? suffixOnTap;
  final bool isPassword;
  final bool isShowPassword;
  final bool isPhone;
  final Function(CountryCode)? countryCodePickerOnChanged;

  const BuildTextFormField({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    required this.hintText,
    this.validatorMsg,
    this.validator,
    this.onSaved,
    this.suffixOnTap,
    this.isPassword = false,
    this.isShowPassword = false,
    this.isPhone = false,
    this.countryCodePickerOnChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: ColorManager.blue,
      validator: validator ?? (val) {
        if(val!.trim().isEmpty) {return validatorMsg;}
        return null;
      },
      onSaved: onSaved,
      obscureText: isPassword && !isShowPassword ? true : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.grey1,
        prefixIcon: isPhone ? CountryCodePicker(
          onChanged: countryCodePickerOnChanged,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          showDropDownButton: true,
          showFlagMain: false,
          showCountryOnly: false,
          initialSelection: 'EG',
          favorite: const ['EG'],
        ) : null,
        suffixIcon: isPassword ? GestureDetector(
          onTap: suffixOnTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(isShowPassword ? Icons.visibility_off : Icons.visibility, color: ColorManager.black)
          ),
        ) : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorManager.grey),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: ColorManager.grey2)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: ColorManager.grey2)),
        disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: ColorManager.grey2)),
        border: const OutlineInputBorder(borderSide: BorderSide(color: ColorManager.grey2)),
      ),
    );
  }
}