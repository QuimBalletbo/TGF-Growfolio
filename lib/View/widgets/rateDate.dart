import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_drop_down.dart';

class RateDate extends StatelessWidget {
  final String text;
  final String defaultText;
  final Function(String) onNumberChanged;
  List<String> dropdownItemList = [
    " 0",
    " 1",
    " 2",
    " 3",
    " 4",
    " 5",
    " 6",
    " 7",
    " 8",
    " 9",
    " 10",
    " 15",
    " 20",
    " 25",
    " 30",
    " 50"
  ];

  RateDate({
    Key? key,
    required this.text,
    required this.defaultText,
    required this.onNumberChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.0, right: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.0, bottom: 5.0),
            child: Container(
              width: 184.h,
              margin: EdgeInsets.only(left: 8.h, right: 15.h),
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: CustomDropDown(
              width: 107.0,
              hintText: defaultText,
              items: dropdownItemList,
              onChanged: (value) {
                onNumberChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
