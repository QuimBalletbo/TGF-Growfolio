import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/widgets/customColorBar2.dart'; // Import CustomColorBar

class CustomAssetList2 extends StatelessWidget {
  final double amount;
  final String name;

  CustomAssetList2({
    required this.amount,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    String title;

    switch (name) {
      case 'durationScore':
        title = _getDurationScoreTitle(amount);
        break;
      case 'returnScore':
        title = _getReturnScoreTitle(amount);
        break;
      case 'allocationScore':
        title = _getAllocationScoreTitle(amount);
        break;
      case 'diversaificationScore':
        title = _getDiversificationScoreTitle(amount);
        break;
      default:
        title = name; //
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Left column
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // Middle column
          Expanded(
            flex: 1,
            child: CustomBar(
              percentage: amount.toInt(), // Use the CustomColorBar widget
            ),
          ),
        ],
      ),
    );
  }

  String _getDurationScoreTitle(double amount) {
    if (amount < 25) {
      return 'Poor Investment Duration';
    } else if (amount < 50) {
      return 'Inadequate Investment Duration';
    } else if (amount < 75) {
      return 'Reasonable Investment Duration';
    } else {
      return 'Optimal Investment Duration';
    }
  }

  String _getReturnScoreTitle(double amount) {
    if (amount < 25) {
      return 'Poor Portfolio Return';
    } else if (amount < 50) {
      return 'Subpar Portfolio Return';
    } else if (amount < 75) {
      return 'Acceptable Portfolio Return';
    } else {
      return 'Exceptional Portfolio Return';
    }
  }

  String _getAllocationScoreTitle(double amount) {
    if (amount < 25) {
      return 'Poor Asset Allocation';
    } else if (amount < 50) {
      return 'Limited Asset Allocation';
    } else if (amount < 75) {
      return 'Reasonable Asset Allocation';
    } else {
      return 'Optimal Asset Allocation';
    }
  }

  String _getDiversificationScoreTitle(double amount) {
    if (amount < 25) {
      return 'Incomplete Diversification';
    } else if (amount < 50) {
      return 'Limited Diversification';
    } else if (amount < 75) {
      return 'Partial Diversification';
    } else {
      return 'Optimal Diversification';
    }
  }

  String _getUnit(String name) {
    switch (name) {
      case 'durationScore':
      case 'returnScore':
      case 'allocationScore':
      case 'diversificationScore':
        return '%';
      default:
        return '€';
    }
  }
}
