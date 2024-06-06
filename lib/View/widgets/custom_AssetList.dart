import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';

class CustomAssetList extends StatelessWidget {
  final AssetReturn asset;
  final double totalAmount;
  final int value;

  CustomAssetList(
      {required this.asset, required this.totalAmount, required this.value});

  @override
  Widget build(BuildContext context) {
    String percentageText = value == 1
        ? '${(asset.totalInvestment / totalAmount * 100).toStringAsFixed(2)}%'
        : '${(asset.finalValue / totalAmount * 100).toStringAsFixed(2)}%';

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Left column
          Expanded(
            flex: 2,
            child: Text(
              asset.name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // Middle column
          Expanded(
            flex: 1,
            child: Text(
              '${asset.totalInvestment.toStringAsFixed(2)} €',
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
