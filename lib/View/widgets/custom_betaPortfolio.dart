import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/portfolio.dart';
import 'package:flutter_application_1/Model/itemBloc.dart';
import 'package:realm/realm.dart';

Widget customStockCard(Portfolio portfolio, ItemBloc singlebloc) {
  return Dismissible(
    key: ValueKey(portfolio.no), // Unique key for each dismissible item
    background: Container(
      color: Colors.red,
    ),
    onDismissed: (direction) => singlebloc.deleteItem(portfolio),
    child: Container(
      width: 367.h,
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
      decoration: AppDecoration.outlinePrimary3
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
      child: Text(
        "Portfolio ${portfolio.no}",
        style: CustomTextStyles.headlineSmallInterWhiteA700,
      ),
    ),
  );
}
