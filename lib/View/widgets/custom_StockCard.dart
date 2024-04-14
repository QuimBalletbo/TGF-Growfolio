import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/itemBloc.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/listStock.dart';

Widget customStockCard(CreatePortfolio portfolio, StockBloc singleStock) {
  return Column(
    children: portfolio.stocks.map((stock) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Dismissible(
          key: ValueKey(stock.id), // Unique key for each dismissible item
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (direction) => singleStock.deleteItem(stock),
          child: Container(
            width: 367.h,
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
            decoration: AppDecoration.outlinePrimary3
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
            child: Text(
              "Portfolio Name: ${stock.name}, Portfolio stockAllocation: ${stock.stockAllocation}, Portfolio fwt: ${stock.fwt}, ",
              style: CustomTextStyles.headlineSmallInterWhiteA700,
            ),
          ),
        ),
      );
    }).toList(),
  );
}
