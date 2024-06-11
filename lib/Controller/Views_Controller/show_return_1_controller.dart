import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'dart:math' as Math;
import 'package:flutter_application_1/Model/noDataBaseData/chartData.dart';
import 'package:flutter/material.dart';

class ShowReturnView1Controller {
  Profile profile = AuthService().getProfile();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late PortfolioReturn portfolio;
  String portfolioName = '';
  String frequencyInvesting = '';
  double amountInvested = 0;
  double finalportfolioValue = 0;
  double finalStockValue = 0;
  double finalETFValue = 0;
  double finalBondValue = 0;
  double avgReturn = 0;
  int score = 0;
  double durationScore = 0;
  double diversaificationScore = 0;
  double returnScore = 0;
  double allocationScore = 0;
  double finalStockPercentage = 0;
  double finalETFPercentage = 0;
  double finalBondPercentage = 0;
  double amountInvestedStock = 0;
  double amountInvestedETF = 0;
  double amountInvestedBond = 0;
  double avgReturnStock = 0;
  double avgReturnETF = 0;
  double avgReturnBond = 0;
  double PMTStock = 0;
  double PMTETF = 0;
  double PMTBond = 0;
  List<double> datePoints = [];
  bool hasStocks = false;
  bool hasETFs = false;
  bool hasBonds = false;

  String initViewData() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    portfolioName = portfolio.name;
    return portfolioName;
  }

  String getFrequencyInvesting() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    frequencyInvesting = portfolio.frequencyInvesting;
    return frequencyInvesting;
  }

  double getAmountInvested() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    amountInvested = portfolio.amountInvested;
    return amountInvested;
  }

  double getFinalportfolioValue() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    finalportfolioValue = portfolio.finalportfolioValue;
    return finalportfolioValue;
  }

  RealmList<AssetReturn> getAssets() {
    RealmList<AssetReturn> assetList = portfolio.assets;
    return assetList;
  }

  double getFinalStockValue() {
    finalStockValue = portfolio.finalStockValue;
    return finalStockValue;
  }

  double getFinalETFValue() {
    finalETFValue = portfolio.finalETFValue;
    return finalETFValue;
  }

  double getFinalBondValue() {
    finalBondValue = portfolio.finalBondValue;
    return finalBondValue;
  }

  double getFinalavgReturn() {
    avgReturn = portfolio.avgReturn;
    return avgReturn;
  }

  double getDurationScore() {
    durationScore = portfolio.durationScore;
    return durationScore;
  }

  double getDiversaificationScore() {
    diversaificationScore = portfolio.diversaificationScore;
    return diversaificationScore;
  }

  double getReturnScore() {
    returnScore = portfolio.returnScore;
    return returnScore;
  }

  double getAllocationScore() {
    allocationScore = portfolio.allocationScore;
    return allocationScore;
  }

  int getScore() {
    score = portfolio.score;
    return score;
  }

  double getFinalStockPercentageValue() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    finalportfolioValue = portfolio.finalportfolioValue;
    finalStockValue = portfolio.finalStockValue;
    finalStockPercentage = (finalStockValue / finalportfolioValue) * 100;
    return finalStockPercentage;
  }

  double getFinalETFPercentageValue() {
    finalportfolioValue = portfolio.finalportfolioValue;
    finalETFValue = portfolio.finalETFValue;
    finalETFPercentage = (finalETFValue / finalportfolioValue) * 100;
    return finalETFPercentage;
  }

  double getFinalBondPercentageValue() {
    finalportfolioValue = portfolio.finalportfolioValue;
    finalBondValue = portfolio.finalBondValue;
    finalBondPercentage = (finalBondValue / finalportfolioValue) * 100;
    return finalBondPercentage;
  }

  double getAmountInvestedStock() {
    double percentage = portfolio.stockAllocationPercentage;
    amountInvestedStock = (percentage / 100) * amountInvested;
    return amountInvestedStock;
  }

  double getAmountInvestedETF() {
    double percentage = portfolio.etfAllocationPercentage;
    amountInvestedETF = (percentage / 100) * amountInvested;
    return amountInvestedETF;
  }

  double getAmountInvestedBond() {
    double percentage = portfolio.bondAllocationPercentage;
    amountInvestedBond = (percentage / 100) * amountInvested;
    return amountInvestedBond;
  }

  int getFrequencyValue(String frequency) {
    switch (frequency) {
      case 'Monthly':
        return 12;
      case 'Quarterly':
        return 4;
      case 'Annual':
        return 1;
      case 'One-time':
        return 0;
      default:
        throw ArgumentError('Invalid frequency: $frequency');
    }
  }

  void getAvgReturnStock() {
    avgReturnStock = 0.001; // Initial value for r
    double calculatedFV = 0.0;
    int frequency = getFrequencyValue(portfolio.frequencyInvesting);

    if (frequency == 0) {
      PMTStock = getAmountInvestedStock();
    } else {
      PMTStock = (getAmountInvestedStock()) / portfolio.duration * frequency;
    }

    while (true) {
      calculatedFV = PMTStock *
          (Math.pow((1 + avgReturnStock), portfolio.duration) - 1) /
          avgReturnStock;
      if (calculatedFV >= portfolio.finalStockValue) {
        break;
      }
      if (avgReturnStock >= 2) {
        break;
      }
      avgReturnStock += 0.001;
    }
  }

  void getAvgReturnETF() {
    avgReturnETF = 0.001; // Initial value for r
    double calculatedFV = 0.0;
    int frequency = getFrequencyValue(portfolio.frequencyInvesting);

    if (frequency == 0) {
      PMTETF = getAmountInvestedETF();
    } else {
      PMTETF = (getAmountInvestedETF()) / portfolio.duration * frequency;
    }

    while (true) {
      calculatedFV = PMTETF *
          (Math.pow((1 + avgReturnETF), portfolio.duration) - 1) /
          avgReturnETF;
      if (calculatedFV >= portfolio.finalETFValue) {
        break;
      }
      if (avgReturnETF >= 2) {
        break;
      }
      avgReturnETF += 0.001;
    }
  }

  void getAvgReturnBond() {
    avgReturnBond = 0.001; // Initial value for r
    double calculatedFV = 0.0;
    int frequency = getFrequencyValue(portfolio.frequencyInvesting);

    if (frequency == 0) {
      PMTBond = getAmountInvestedBond();
    } else {
      PMTBond = (getAmountInvestedBond()) / portfolio.duration * frequency;
    }

    while (true) {
      calculatedFV = PMTBond *
          (Math.pow((1 + avgReturnBond), portfolio.duration) - 1) /
          avgReturnBond;
      if (calculatedFV >= portfolio.finalBondValue) {
        break;
      }
      if (avgReturnBond >= 2) {
        break;
      }
      avgReturnBond += 0.001;
    }
  }

  void splitTime() {
    if (portfolio.duration < 1 || portfolio.duration > 50) {
      throw ArgumentError('The number must be between 1 and 50.');
    }

    double step = portfolio.duration / 6;

    for (int i = 1; i <= 6; i++) {
      double value = step * i;
      if (portfolio.duration <= 5) {
        // Round to the nearest 0.5
        double roundedValue = (value * 2).round() / 2.0;
        datePoints.add(roundedValue);
      } else {
        datePoints.add(value.round().toDouble());
      }
    }
  }

  List<ChartData> createChartData() {
    List<ChartData> chartData = [];

    for (int i = 0; i < datePoints.length; i++) {
      double yearValue = datePoints[i];
      String yearString;

      if (yearValue == yearValue.roundToDouble()) {
        // It's an integer
        yearString = 'year ${yearValue.toInt()}';
      } else {
        // It's a decimal (specifically .5)
        yearString = 'year ${yearValue}';
      }

      chartData.add(ChartData(
        yearString,
        PMTStock *
            (Math.pow((1 + avgReturnStock), yearValue) - 1) /
            avgReturnStock,
        PMTETF * (Math.pow((1 + avgReturnETF), yearValue) - 1) / avgReturnETF,
        PMTBond *
            (Math.pow((1 + avgReturnBond), yearValue) - 1) /
            avgReturnBond,
        const Color(0xFF3D2FE7), // Color for stocks
        const Color(0xFF2BD9FE), // Color for ETFs
        const Color(0xFF2BFE7F), // Color for Bonds
      ));
    }

    return chartData;
  }

  bool getHasStocks() {
    if (portfolio.finalStockValue > 0) {
      hasStocks = true;
    } else {
      hasStocks = false;
    }
    return hasStocks;
  }

  bool getHasETFs() {
    if (portfolio.finalETFValue > 0) {
      hasETFs = true;
    } else {
      hasETFs = false;
    }
    return hasETFs;
  }

  bool getHasBonds() {
    if (portfolio.finalBondValue > 0) {
      hasBonds = true;
    } else {
      hasBonds = false;
    }
    return hasBonds;
  }
}
