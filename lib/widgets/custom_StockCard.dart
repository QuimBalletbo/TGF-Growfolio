import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';

Widget customStockCard(String text) {
  return Container(
    width: 367.h,
    margin: EdgeInsets.symmetric(horizontal: 2.h),
    padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
    decoration: AppDecoration.outlinePrimary3
        .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
    child: Text(
      text,
      style: CustomTextStyles.headlineSmallInterWhiteA700,
    ),
  );
}
