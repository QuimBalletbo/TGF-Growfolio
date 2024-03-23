import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class ArrowBackIosColumn extends StatelessWidget {
  final String text;

  const ArrowBackIosColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.h, top: 2.v, left: 2.h),
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24),
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
                text,
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

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }
}
