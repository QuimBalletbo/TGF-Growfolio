import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class TextNumberInfo extends StatelessWidget {
  final String text;
  final double value;

  const TextNumberInfo({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    String formattedValue = value.toStringAsFixed(2);
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
      case 'score':
        title = 'Portfolio Score';
        break;
      case 'final':
        title = 'Final Portfolio Value';
        break;
      default:
        title = 'Individual Asset Investment';
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
              '$formattedValue €',
              style: CustomTextStyles.bodyLargeLight,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}