import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';

class CustomCardButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onTap;

  const CustomCardButton({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // directly call the onTap function
      child: Container(
        width: double.maxFinite,
        decoration: AppDecoration.outlinePrimary10,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: SizedBox(
            height: 46.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: imagePath,
                          height: 28.v,
                          width: 30.h,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24.h,
                            top: 2.v,
                            bottom: 3.v,
                          ),
                          child: Text(
                            text,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
