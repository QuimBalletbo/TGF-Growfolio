import 'package:flutter/material.dart';

class CustomAssetList extends StatelessWidget {
  final double totalAmount;
  final double amount;
  final String name;

  CustomAssetList(
      {required this.name, required this.totalAmount, required this.amount});

  @override
  Widget build(BuildContext context) {
    String percentageText =
        '${(amount / totalAmount * 100).toStringAsFixed(2)}%';
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
              '${amount.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          // Right column
          Expanded(
            flex: 1,
            child: Text(
              percentageText,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
