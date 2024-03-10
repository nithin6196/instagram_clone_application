// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.buttonColor = ColorConstants.primaryBlue,
      this.textColor = ColorConstants.primaryWhite,
      this.haveBorder = false,
      this.onTap,
      this.verticalPadding = 15,
      this.horizontalPadding = 0});

  final String text;
  final Color textColor;
  final Color buttonColor;
  final bool haveBorder;
  final double verticalPadding;
  final double horizontalPadding;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
          border: haveBorder == true
              ? Border.all(color: ColorConstants.primaryBlack.withOpacity(0.4))
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
