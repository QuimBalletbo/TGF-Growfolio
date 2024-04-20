import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/listBond.dart';

Widget customBondCard(
    CreateBond bond, BondBloc singleBond, VoidCallback updateUI) {
  return Dismissible(
    key: ValueKey(bond.name), // Unique key for each dismissible item
    background: Container(
      color: Colors.red,
    ),
    onDismissed: (direction) {
      singleBond.deleteItem(bond);
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
                bond.name, // Display bond name on the left side
                maxLines: 2, // Allow multiline text
                overflow: TextOverflow.ellipsis, // Handle overflow
                style: CustomTextStyles.headlineSmallInterWhiteA700,
              ),
            ),
          ),
          const SizedBox(
              width: 8), // Add space between bond allocation and cancel button
          Row(
            children: [
              Text(
                '${bond.bondAllocation} %', // Display bond allocation in the middle
                style: CustomTextStyles.headlineSmallInterWhiteA700,
              ),
              IconButton(
                icon: const Icon(Icons.cancel),
                color: Colors.white, // Set button color to white
                onPressed: () {
                  singleBond.deleteItem(bond);
                  updateUI(); // Call updateUI to trigger UI update
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
