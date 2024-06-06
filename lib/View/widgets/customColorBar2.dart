import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  final int percentage; // The percentage of the bar filled by Color(0xFF3D2FE7)

  CustomBar({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        height: 10.0,
        child: Row(
          children: [
            Expanded(
              flex: percentage,
              child: Container(
                color: const Color(0xFF3D2FE7), // Filled color
              ),
            ),
            Expanded(
              flex: 100 - percentage,
              child: Container(
                color: const Color(0xFFDDDDDD), // Remaining space color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
