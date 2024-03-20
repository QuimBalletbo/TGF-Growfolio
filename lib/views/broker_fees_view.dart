import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/views/components/broker_fees_dialog.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_space_button.dart';

// ignore_for_file: must_be_immutable
class BrokerFeesConfigurationOneScreen extends StatelessWidget {
  const BrokerFeesConfigurationOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // AppBar
                _buildArrowBackIosColumn(context), // Placing the app bar here

                SizedBox(height: 22.v),
                PortfolioConfigurationDialog(),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Continue",
                  onTap: () {
                    onTapContinue(context);
                  },
                ),
                SizedBox(height: 16.v),
                CustomSpaceButton(
                  text: "Cancel",
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
                  onTap: () {
                    onTapHome(context);
                  },
                ),

                SizedBox(height: 16.v),
                // Form Content
              ],
            ),
          ),
        ],
      ),
    );
  }

// can you modify the _buildArrowBackIosColumn making the cancel text be larger but keeping the image the same size?

  Widget _buildArrowBackIosColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.h, top: 2.v, left: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 24),
      decoration: AppDecoration.outlinePrimary8
          .copyWith(borderRadius: BorderRadiusStyle.customBorderBL30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  GestureDetector(
                    onTap: () {
                      onTapGoBack(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    width: 60.0, // Adjust the width as needed
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapHome(context);
                    },
                    child: Container(
                      child: CustomImageView(
                        imagePath: ImageConstant.imgVector3,
                        height: 90.v,
                        width: 32.h,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                "New Portfolio",
                style: theme.textTheme.displayMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                "Portfolio initial configuration",
                style: CustomTextStyles.headlineSmallMontserratLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }

  onTapContinue(BuildContext context) {}

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
