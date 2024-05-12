import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

Widget customSymbolContainer(String symbol) {
  return Container(
    width: 367.h,
    margin: EdgeInsets.symmetric(horizontal: 2.h),
    padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
    decoration: AppDecoration.outlinePrimary3
        .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(
                right: 8.0), // Add padding between symbol name and allocation
            child: Text(
              symbol, // Display symbol name on the left side
              maxLines: 2, // Allow multiline text
              overflow: TextOverflow.ellipsis, // Handle overflow
              style: CustomTextStyles.headlineSmallInterWhiteA700,
            ),
          ),
        ),
      ],
    ),
  );
}
