import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/itemBloc.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/listCreatePortfolio.dart';

Widget customPortfolioCard(
    CreatePortfolio createPortfolios, PortfolioBloc singlePortfolio) {
  return Dismissible(
    key:
        ValueKey(createPortfolios.name), // Unique key for each dismissible item
    background: Container(
      color: Colors.red,
    ),
    onDismissed: (direction) => singlePortfolio.deleteItem(createPortfolios),
    child: Container(
      width: 367.h,
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
      decoration: AppDecoration.outlinePrimary3
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
      child: Text(
        "Portfolio Name: ${createPortfolios.name}, Portfolio duration: ${createPortfolios.duration}, Portfolio monetaryObjective: ${createPortfolios.monetaryObjective}, Portfolio frequencyInvesting: ${createPortfolios.frequencyInvesting}, Portfolio taxation: ${createPortfolios.taxation}, Portfolio brokerFees: ${createPortfolios.brokerFees}, Portfolio rebalancing: ${createPortfolios.rebalancing}",
        style: CustomTextStyles.headlineSmallInterWhiteA700,
      ),
    ),
  );
}
