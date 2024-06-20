import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_switch.dart';

class ToggleButton extends StatelessWidget {
  final String text;

  final Function(bool) onToggleChanged;

  ToggleButton({
    Key? key,
    required this.text,
    required this.onToggleChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.v, bottom: 8.v),
            child: Container(
              width: 108.h,
              margin: EdgeInsets.only(left: 8.h, right: 15.h),
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          Expanded(
            child: CustomSwitch(
              initialValue: false,
              onChange: (value) {
                onToggleChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
