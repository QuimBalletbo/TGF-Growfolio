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
              child: Padding(
                padding: const EdgeInsets.only(
                    right:
                        8.0), // Add padding between bond name and bond allocation
                child: Text(
                  portfolio.name, // Display bond name on the left side
                  maxLines: 4, // Allow multiline text
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  style: CustomTextStyles.headlineSmallInterWhiteA700,
                ),
              ),
            ),
            const SizedBox(
                width:
                    8), // Add space between bond allocation and cancel button
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.cancel),
                  color: Colors.white, // Set button color to white
                  onPressed: () {
                    singlePortfolio.deleteItem(portfolio);
                    updateUI(); // Call updateUI to trigger UI update
                  },
                ),
              ],
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
