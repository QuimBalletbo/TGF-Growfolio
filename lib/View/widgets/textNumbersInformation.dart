import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class TextNumberInfo extends StatelessWidget {
  final String text;
  final int value;

  const TextNumberInfo({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    if (value == 1) {
      title = 'Total Amount Invested for Each Asset';
    } else if (value == 2) {
      title = 'Total Value for Each Asset';
    } else if (value == 3) {
      title = 'Final Portfolio Value';
    } else {
      title = 'Total Investment';
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Text(
                title,
                style: CustomTextStyles.bodyLargeLight,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$text €',
              style: CustomTextStyles.bodyLargeLight,
              textAlign: TextAlign.center,
            ),
          ),
          if (value != 3 && value != 4)
            Expanded(
              flex: 1,
              child: Text(
                '100%',
                style: CustomTextStyles.bodyLargeLight,
                textAlign: TextAlign.right,
              ),
            ),
        ],
      ),
    );
  }
}
