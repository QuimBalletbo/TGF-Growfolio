import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class CustomColorBar extends StatelessWidget {
  final int value1;
  final int value2;
  final int value3;

  CustomColorBar({
    required this.value1,
    required this.value2,
    required this.value3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildColorBar(),
        const SizedBox(height: 4),
        _buildPercentages(),
        const SizedBox(height: 4),
        _buildSquaresWithWords(),
      ],
    );
  }

  Widget _buildColorBar() {
    if (value1 == 0 && value2 == 0 && value3 == 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 24.0,
          color: appTheme.gray200,
        ),
      );
    }

    double total = (value1 + value2 + value3).toDouble();
    double leftWidth = (value1 / total);
    double centerWidth = (value2 / total);
    double rightWidth = (value3 / total);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        height: 24.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [
              Color(0xFF3D2FE7), // Left color
              Color(0xFF2BD9FE), // Center color
              Color(0xFF2BFE7F), // Right color
            ],
            stops: [
              value1 / total,
              (value1 + value2) / total,
              1.0,
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: value1,
              child: Container(
                width: leftWidth,
                color: Color(0xFF3D2FE7),
              ),
            ),
            Expanded(
              flex: value2,
              child: Container(
                width: centerWidth,
                color: Color(0xFF2BD9FE),
              ),
            ),
            Expanded(
              flex: value3,
              child: Container(
                width: rightWidth,
                color: Color(0xFF2BFE7F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('${value1.toString()}%'),
        Text('${value2.toString()}%'),
        Text('${value3.toString()}%'),
      ],
    );
  }

  Widget _buildSquaresWithWords() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSquareWithWord('Stocks', Color(0xFF3D2FE7)),
        _buildSquareWithWord('ETFs', Color(0xFF2BD9FE)),
        _buildSquareWithWord('Bonds', Color(0xFF2BFE7F)),
      ],
    );
  }

  Widget _buildSquareWithWord(String word, Color color) {
    return Row(
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.only(right: 4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        Text(word),
      ],
    );
  }
}
