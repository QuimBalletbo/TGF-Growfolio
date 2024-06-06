import 'package:flutter/material.dart';

class CustomAssetList2 extends StatelessWidget {
  final double amount;
  final String name;
  final bool isPercentage; // Add a boolean parameter

  CustomAssetList2({
    required this.amount,
    required this.name,
    required this.isPercentage, // Initialize the boolean parameter
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
                  : '${amount.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          // Right column
        ],
      ),
    );
  }
}
