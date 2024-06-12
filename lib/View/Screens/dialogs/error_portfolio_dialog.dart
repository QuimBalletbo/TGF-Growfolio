import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class ErrorPortfolioDialog extends StatelessWidget {
  ErrorPortfolioDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
        decoration: AppDecoration.outlinePrimary8
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.v),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(
                  "Something Went Wrong",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium,
                ),
              ),
            ),
            const SizedBox(height: 6.0),
            Divider(
              color: appTheme.deepOrange200,
              indent: 4.0,
              endIndent: 4.0,
            ),
            SizedBox(height: 20.v),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(
                  "We encountered an error while processing your portfolio calculation. Please check the following:",
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "• ",
                          style: CustomTextStyles.bodyMediumInterff1e1e1e,
                        ),
                        Expanded(
                          child: Text(
                            "Ensure that all information provided is accurate.",
                            style: CustomTextStyles.bodyMediumInterff1e1e1e,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "• ",
                          style: CustomTextStyles.bodyMediumInterff1e1e1e,
                        ),
                        Expanded(
                          child: Text(
                            "Verify your internet connection.",
                            style: CustomTextStyles.bodyMediumInterff1e1e1e,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "• ",
                          style: CustomTextStyles.bodyMediumInterff1e1e1e,
                        ),
                        Expanded(
                          child: Text(
                            "Try the calculation again in a moment.",
                            style: CustomTextStyles.bodyMediumInterff1e1e1e,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60.v),
            Text(
              "*If the issue persists, please contact our support team for assistance at joaquim.balletbo@students.salle.url.edu. We apologize for any inconvenience.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
            SizedBox(height: 20.v),
          ],
        ),
      ),
    );
  }
}
