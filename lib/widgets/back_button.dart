import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class backButton extends StatelessWidget {
  final Function() onPressed;

  const backButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: lightGrey,
          width: 2,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          CupertinoIcons.xmark,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
