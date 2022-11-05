import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double height;
  final double elevation;
  final double radius;
  final IconData? icon;
  final String? image;

  const BuildButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonColor = ColorManager.teal,
    this.borderColor = Colors.transparent,
    this.textColor = ColorManager.white,
    this.width = double.infinity,
    this.height = 55,
    this.elevation = 1,
    this.radius = 10,
    this.icon,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width,
      height: height,
      color: buttonColor,
      elevation: elevation,
      hoverElevation: elevation,
      focusElevation: elevation,
      highlightElevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(color: borderColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(icon != null) Icon(icon, color: ColorManager.white, size: 18),
          if(icon != null) const SizedBox(width: 10),

          if(image != null) Image.asset(image!, width: 20, height: 20),
          if(image != null) const SizedBox(width: 10),

          Text(text, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}