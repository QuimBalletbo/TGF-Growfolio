import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class ArrowBackIosColumn extends StatelessWidget {
  final String text;
  final String title;
  final int position;

  const ArrowBackIosColumn({
    Key? key,
    required this.text,
    required this.title,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool page1 = position == 1;
    bool page2 = position == 2;
    bool page3 = position == 3;
    bool page4 = position == 4;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24),
      decoration: AppDecoration.outlinePrimary3
          .copyWith(borderRadius: BorderRadiusStyle.customBorderBL30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 42.v),
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
                      color: Colors.white,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: page1,
                    child: const Icon(Icons.circle,
                        color: Colors.black, size: 8.0),
                  ),
                  Visibility(
                    visible: !page1,
                    child:
                        const Icon(Icons.circle, color: Colors.grey, size: 8.0),
                  ),
                  const SizedBox(width: 4.0),
                  Visibility(
                    visible: page2,
                    child: const Icon(Icons.circle,
                        color: Colors.black, size: 8.0),
                  ),
                  Visibility(
                    visible: !page2,
                    child:
                        const Icon(Icons.circle, color: Colors.grey, size: 8.0),
                  ),
                  const SizedBox(width: 4.0),
                  Visibility(
                    visible: page3,
                    child: const Icon(Icons.circle,
                        color: Colors.black, size: 8.0),
                  ),
                  Visibility(
                    visible: !page3,
                    child:
                        const Icon(Icons.circle, color: Colors.grey, size: 8.0),
                  ),
                  const SizedBox(width: 4.0),
                  Visibility(
                    visible: page4,
                    child: const Icon(Icons.circle,
                        color: Colors.black, size: 8.0),
                  ),
                  Visibility(
                    visible: !page4,
                    child:
                        const Icon(Icons.circle, color: Colors.grey, size: 8.0),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      onTapHome(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.h, top: 2.v, left: 2.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgVector3,
                        height: 42.v,
                        width: 32.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 60, // Adjust this width to force the text to wrap
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Return to Home",
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                title,
                style: CustomTextStyles.bodyLargeWhite,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                text,
                style: CustomTextStyles.headlineSmallMontserratLightWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }
}
