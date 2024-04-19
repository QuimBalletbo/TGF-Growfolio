import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/listETF.dart';

Widget customETFCard(CreateETF etf, ETFBloc singleETF) {
  return Dismissible(
    key: ValueKey(etf.name), // Unique key for each dismissible item
    background: Container(
      color: Colors.red,
    ),
    onDismissed: (direction) => singleETF.deleteItem(etf),
    child: Container(
      width: 367.h,
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
      decoration: AppDecoration.outlinePrimary3
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
      child: Text(
        "Name: ${etf.name}, StockAllocation: ${etf.eTFAllocation}, Fwt: ${etf.fwt}, ExpenseRatio: ${etf.expRatio}, AvgReturn: ${etf.avgReturn}, AvgDividendYield: ${etf.avgDividend}",
        style: CustomTextStyles.headlineSmallInterWhiteA700,
      ),
    ),
  );
}
