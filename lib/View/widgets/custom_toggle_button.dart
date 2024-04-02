import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_switch.dart';

class ToggleButton extends StatelessWidget {
  final String text;

  const ToggleButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isToggleSelected = false;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.v, bottom: 8.v),
            child: Container(
              width: 78.h,
              margin: EdgeInsets.only(left: 8.h, right: 15.h),
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallRegular11,
              ),
            ),
          ),
          Expanded(
            child: CustomSwitch(
              initialValue: isToggleSelected,
              onChange: (value) {
                // No state change needed here as it's stateless
              },
            ),
          ),
        ],
      ),
    );
  }
}