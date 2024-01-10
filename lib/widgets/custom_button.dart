import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';
import '../screens/home_screen.dart';

class CustomButton extends StatelessWidget {
  final String buttonText ;
  final Function() onPressed;

  const CustomButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.only(bottom: 30),
          alignment: Alignment.center,
          width: size.width - 100,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: headingText(
            buttonText,
            blue,
            18,
          ),
        ),
      ),
    );
  }
}
