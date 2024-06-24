import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';

class CustomAssetList extends StatelessWidget {
  final AssetReturn asset;

  CustomAssetList({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              asset.name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(), // Pushes the next widget to the end of the row
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${asset.monthlyInvestment.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 16),
              overflow:
                  TextOverflow.ellipsis, // Ellipsize if exceeds maximum lines
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
