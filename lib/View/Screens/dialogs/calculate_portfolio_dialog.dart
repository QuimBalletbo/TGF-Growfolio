import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class CalculatePortfolioDialog extends StatelessWidget {
  CalculatePortfolioDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(
                  "Calculating Portfolio",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium,
                ),
              ),
            ),
            SizedBox(height: 10.v),
            // Loading Indicator
            const Center(
              child: CircularProgressIndicator(), // Loading indicator
            ),
          ],
        ),
      ),
    );
  }
}
