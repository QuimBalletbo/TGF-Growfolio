import 'package:flutter/material.dart';

class CustomAssetList2 extends StatelessWidget {
  final double amount;
  final String name;
  final bool isPercentage;
  final bool isInt; // Add a boolean parameter

  CustomAssetList2({
    required this.amount,
    required this.name,
    required this.isPercentage,
    required this.isInt, // Initialize the boolean parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Left column
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // Middle column
          Expanded(
            flex: 1,
            child: Text(
              isPercentage
                  ? '${amount.toStringAsFixed(2)} %'
                  : isInt
                      ? '${amount.toStringAsFixed(0)} y'
                      : '${amount.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ),
          // Right column
        ],
      ),
    );
  }
}
