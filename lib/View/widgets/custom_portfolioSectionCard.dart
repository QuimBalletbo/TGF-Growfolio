import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

typedef void VoidCallback();

Widget customPortfolioSection(
    String name, int distribution, VoidCallback onPressed) {
  Color backgroundColor =
      distribution < 99 ? const Color(0xFFEAEAEA) : const Color(0xFF292782);
  Color textColor = distribution < 99 ? Colors.red : Colors.white;

  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 367.h,
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
      decoration: AppDecoration.outlinePrimary3.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder18,
          color: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(color: textColor, fontSize: 16.0),
          ),
          Text(
            "$distribution %",
            style: TextStyle(color: textColor, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}
