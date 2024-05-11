import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/Model/listReturnPortfolio.dart';
import 'package:realm/realm.dart';

import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/profile.dart';

Widget customPortfolioReturnCard(
    PortfolioReturn portfolio,
    ReturnPortfolioBloc singlePortfolio,
    VoidCallback updateUI,
    BuildContext context) {
  return GestureDetector(
    onTap: () {
      onTapContinue(context, portfolio.id);
    },
    child: Dismissible(
      key: ValueKey(portfolio.name), // Unique key for each dismissible item
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        singlePortfolio.deleteItem(portfolio);
        updateUI(); // Call updateUI to trigger UI update
      },
      child: Container(
        width: 367.h,
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
        decoration: AppDecoration.outlinePrimary3
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "Name: ${portfolio.name} allocationScore: ${portfolio.allocationScore} amountInvested: ${portfolio.amountInvested}  avgReturn: ${portfolio.avgReturn} diversaificationScore: ${portfolio.diversaificationScore} duration: ${portfolio.duration}  durationScore: ${portfolio.durationScore} finalBondValue: ${portfolio.finalBondValue} finalETFValue: ${portfolio.finalETFValue} finalStockValue: ${portfolio.finalStockValue} finalportfolioValue: ${portfolio.finalportfolioValue}  name: ${portfolio.name} returnScore: ${portfolio.returnScore} score: ${portfolio.score}           ",
                style: CustomTextStyles.headlineSmallInterWhiteA700,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

onTapContinue(BuildContext context, ObjectId id) {
  // Wait for 3 seconds
  Profile profile = AuthService().getProfile();
  final Realm realm = AuthService().getRealm();

  realm.write(() {
    profile.selectedPortfolio = id;
  });

  Navigator.pushNamed(context, AppRoutes.showReturnView1);
}
