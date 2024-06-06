import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class NameTitleText extends StatelessWidget {
  final String text;

  NameTitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;

    switch (text.toLowerCase()) {
      case 'monthly':
        title = 'Individual Asset Monthly Investment';
        break;
      case 'one-time':
        title = 'Individual Asset one-time Investment';
        break;
      case 'quarterly':
        title = 'Individual Asset quarterly Investment';
        break;
      case 'annual':
        title = 'Individual Asset annual Investment';
        break;
      case 'portfolio':
        title = 'Portfolio Performance Analysis';
        break;
      default:
        title = 'Individual Asset Investment';
    }

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Text(
              title,
              style: CustomTextStyles.bodyLargeLight,
            ),
          ),
        ],
      ),
    );
  }
}
