import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/listStock.dart';

Widget customStockCard(CreateStock stock, StockBloc singleStock) {
  return Dismissible(
    key: ValueKey(stock.name), // Unique key for each dismissible item
    background: Container(
      color: Colors.red,
    ),
    onDismissed: (direction) => singleStock.deleteItem(stock),
    child: Container(
      width: 367.h,
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
      decoration: AppDecoration.outlinePrimary3
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
      child: Text(
        "Name: ${stock.name}, StockAllocation: ${stock.stockAllocation}, Fwt: ${stock.fwt}, ",
        style: CustomTextStyles.headlineSmallInterWhiteA700,
      ),
    ),
  );
}
