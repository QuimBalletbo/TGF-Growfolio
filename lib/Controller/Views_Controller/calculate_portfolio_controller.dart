import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/Model/noDataBaseData/stockReturn.dart';
import 'dart:math';

class CalculatePortfolioController {
  CreatePortfolio createPortfolio = AuthService().getCreatePortfolio();
  RealmResults<PortfolioReturn> allPortfolioReturn =
      AuthService().getPortfolioReturn();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  ObjectId newportfolioID = ObjectId();
  int endedCalculations = 0;
  List<StockReturn> singleAssetReturn = [];

  void calculatePortfolioReturn() {
    try {
      endedCalculations = 0;
      String frequency = createPortfolio.frequencyInvesting;

      // Initialize the amount invested and current portfolio value
      double amountInvestedPeriodically = 1;
      double avgAnualReturn = 0;
      double totalAmountInvested = 0;
      double portfolioValueStocks = 0;
      double portfolioValueETFs = 0;
      double portfolioValueBonds = 0;
      double currentPortfolioValue = 0;
      double amountWithBrokerFee = 0;
      double necesaryValue = 0;
      double accountMaintenanceFlatFee = 0;
      double amountWithTaxation = 0;
      double allocationScore = 0;
      double diversificationScore = 0;
      double durationScore = 0;
      double returnScore = 0;
      double bondAllocationPercentage =
          createPortfolio.bondAllocationPercentage;
      double etfAllocationPercentage = createPortfolio.etfAllocationPercentage;
      double stockAllocationPercentage =
          createPortfolio.stockAllocationPercentage;

      // Calculate flat fee and amount with tax based on portfolio settings
      if (createPortfolio.brokerFees) {
        amountWithBrokerFee = (createPortfolio.monetaryObjective *
                (1 + (createPortfolio.stockSaleFee / 100))) +
            createPortfolio.stockSaleFlatFee;
        accountMaintenanceFlatFee = createPortfolio.accountMaintenanceFlatFee;
      } else {
        amountWithBrokerFee = createPortfolio.monetaryObjective;
        accountMaintenanceFlatFee = 0;
      }
      if (createPortfolio.taxation &&
          createPortfolio.shortToLongTransition > createPortfolio.duration) {
        amountWithTaxation =
            amountWithBrokerFee * (1 + createPortfolio.taxRateShortTerm / 100);
      }
      if (createPortfolio.taxation &&
          createPortfolio.shortToLongTransition < createPortfolio.duration) {
        amountWithTaxation =
            amountWithBrokerFee * (1 + createPortfolio.taxRateLongTerm / 100);
      } else {
        amountWithTaxation = amountWithBrokerFee;
      }

      necesaryValue = amountWithTaxation +
          (accountMaintenanceFlatFee * createPortfolio.duration);

      // Iterate until the current portfolio value reaches or exceeds the monetary objective
      while (currentPortfolioValue < necesaryValue) {
        totalAmountInvested = 0;
        currentPortfolioValue = 0;
        portfolioValueStocks = 0;
        portfolioValueETFs = 0;
        portfolioValueBonds = 0;
        singleAssetReturn.clear();
        if (createPortfolio.includeStocks) {
          // Calculate total effective growth for all stocks
          for (int i = 0; i < createPortfolio.stocks.length; i++) {
            double effectiveAnualStockGrowth = 0;
            double effectiveStockGrowth = 0;

            // Calculate effective annual growth for the current stock
            if (createPortfolio.stocks[i].fwt && createPortfolio.taxation) {
              effectiveAnualStockGrowth = (1 - (createPortfolio.fwt / 100)) *
                      (createPortfolio.stocks[i].avgReturn / 100) +
                  ((createPortfolio.stocks[i].avgDividend / 100) -
                          createPortfolio.dividendTax / 100) *
                      (createPortfolio.stocks[i].avgDividend / 100);
            } else if (!createPortfolio.stocks[i].fwt &&
                createPortfolio.taxation) {
              effectiveAnualStockGrowth =
                  (createPortfolio.stocks[i].avgReturn / 100) +
                      ((createPortfolio.stocks[i].avgDividend / 100) -
                              createPortfolio.dividendTax / 100) *
                          (createPortfolio.stocks[i].avgDividend / 100);
            } else if (createPortfolio.stocks[i].fwt &&
                !createPortfolio.taxation) {
              effectiveAnualStockGrowth = (1 - (createPortfolio.fwt / 100)) *
                      (createPortfolio.stocks[i].avgReturn / 100) +
                  ((createPortfolio.stocks[i].avgDividend / 100));
            } else {
              effectiveAnualStockGrowth =
                  (createPortfolio.stocks[i].avgReturn / 100) +
                      (createPortfolio.stocks[i].avgDividend / 100);
            }

            if (createPortfolio.brokerFees) {
              effectiveAnualStockGrowth -=
                  createPortfolio.stockPurchaseFee / 100;
              effectiveAnualStockGrowth -=
                  createPortfolio.accountMaintenanceFee / 100;
            }

            // Calculate effective growth based on frequency of investing

            // Calculate the returns for the given period of the stock
            double stockAllocation =
                createPortfolio.stocks[i].stockAllocation / 100.0;
            double stockValueChange = 0;
            double finalObjective = 0;
            if (frequency == 'Monthly' ||
                frequency == 'Quarterly' ||
                frequency == 'Annual' ||
                frequency == 'One-time') {
              int periods = 0;
              if (frequency == 'Monthly') {
                effectiveStockGrowth = effectiveAnualStockGrowth / 12;
                periods = 12 * createPortfolio.duration;
              } else if (frequency == 'Quarterly') {
                effectiveStockGrowth = effectiveAnualStockGrowth / 4;
                periods = 4 * createPortfolio.duration;
              } else if (frequency == 'Annual' || frequency == 'One-time') {
                effectiveStockGrowth = effectiveAnualStockGrowth;
                periods = createPortfolio.duration;
              }
              if (frequency == 'One-time') {
                if (createPortfolio.brokerFees) {
                  stockValueChange = ((amountInvestedPeriodically *
                              pow((1 + effectiveStockGrowth),
                                  createPortfolio.duration)) *
                          stockAllocation *
                          (createPortfolio.stockAllocationPercentage / 100)) -
                      createPortfolio.stockPurchaseFlatFee;
                } else {
                  stockValueChange = ((amountInvestedPeriodically *
                          pow((1 + effectiveStockGrowth),
                              createPortfolio.duration)) *
                      stockAllocation *
                      (createPortfolio.stockAllocationPercentage / 100));
                }
              } else {
                if (createPortfolio.brokerFees) {
                  stockValueChange = ((amountInvestedPeriodically *
                              (pow((1 + effectiveStockGrowth), periods) - 1) /
                              effectiveStockGrowth) *
                          stockAllocation *
                          (createPortfolio.stockAllocationPercentage / 100)) -
                      createPortfolio.stockPurchaseFlatFee;
                } else {
                  stockValueChange = ((amountInvestedPeriodically *
                              (pow((1 + effectiveStockGrowth), periods) - 1) /
                              effectiveStockGrowth) *
                          stockAllocation) *
                      (createPortfolio.stockAllocationPercentage / 100);
                }
              }
              finalObjective =
                  (createPortfolio.monetaryObjective * stockValueChange) /
                      necesaryValue;
              singleAssetReturn.add(StockReturn(
                assetID: createPortfolio.stocks[i].id,
                finalValue: finalObjective,
              ));
            }
            // Update the current portfolio value
            portfolioValueStocks += stockValueChange;
            currentPortfolioValue += stockValueChange;
          }
        }
        if (createPortfolio.includeETF) {
          // Calculate total effective growth for all stocks
          for (int i = 0; i < createPortfolio.etfs.length; i++) {
            double effectiveAnualETFGrowth = 0;
            double effectiveETFGrowth = 0;

            // Calculate effective annual growth for the current stock
            if (createPortfolio.etfs[i].fwt && createPortfolio.taxation) {
              effectiveAnualETFGrowth = (1 -
                          (createPortfolio.fwt / 100) -
                          (createPortfolio.etfs[i].expRatio / 100)) *
                      (createPortfolio.etfs[i].avgReturn / 100) +
                  ((createPortfolio.etfs[i].avgDividend / 100) -
                          createPortfolio.dividendTax / 100) *
                      (createPortfolio.etfs[i].avgDividend / 100);
            } else if (!createPortfolio.etfs[i].fwt &&
                createPortfolio.taxation) {
              effectiveAnualETFGrowth =
                  (1 - (createPortfolio.etfs[i].expRatio / 100)) *
                          (createPortfolio.etfs[i].avgReturn / 100) +
                      ((createPortfolio.etfs[i].avgDividend / 100) -
                              createPortfolio.dividendTax / 100) *
                          (createPortfolio.etfs[i].avgDividend / 100);
            } else if (createPortfolio.etfs[i].fwt &&
                !createPortfolio.taxation) {
              effectiveAnualETFGrowth = (1 -
                          (createPortfolio.fwt / 100) -
                          (createPortfolio.etfs[i].expRatio / 100)) *
                      (createPortfolio.etfs[i].avgReturn / 100) +
                  ((createPortfolio.etfs[i].avgDividend / 100));
            } else {
              effectiveAnualETFGrowth =
                  (1 - (createPortfolio.etfs[i].expRatio / 100)) *
                          (createPortfolio.etfs[i].avgReturn / 100) +
                      (createPortfolio.etfs[i].avgDividend / 100);
            }
            if (createPortfolio.brokerFees) {
              effectiveAnualETFGrowth -= createPortfolio.stockPurchaseFee / 100;
              effectiveAnualETFGrowth -=
                  createPortfolio.accountMaintenanceFee / 100;
            }

            // Calculate the returns for the given period of the stock
            double etfAllocation =
                createPortfolio.etfs[i].eTFAllocation / 100.0;
            double etfValueChange = 0;
            double finalObjective = 0;
            if (frequency == 'Monthly' ||
                frequency == 'Quarterly' ||
                frequency == 'Annual' ||
                frequency == 'One-time') {
              int periods = 0;
              if (frequency == 'Monthly') {
                effectiveETFGrowth = effectiveAnualETFGrowth / 12;
                periods = 12 * createPortfolio.duration;
              } else if (frequency == 'Quarterly') {
                effectiveETFGrowth = effectiveAnualETFGrowth / 4;
                periods = 4 * createPortfolio.duration;
              } else if (frequency == 'Annual' || frequency == 'One-time') {
                effectiveETFGrowth = effectiveAnualETFGrowth;
                periods = createPortfolio.duration;
              }
              if (frequency == 'One-time') {
                if (createPortfolio.brokerFees) {
                  etfValueChange = ((amountInvestedPeriodically *
                              pow((1 + effectiveETFGrowth), periods)) *
                          etfAllocation *
                          (createPortfolio.etfAllocationPercentage / 100)) -
                      createPortfolio.stockPurchaseFlatFee;
                } else {
                  etfValueChange = ((amountInvestedPeriodically *
                          pow((1 + effectiveETFGrowth), periods)) *
                      etfAllocation *
                      (createPortfolio.etfAllocationPercentage / 100));
                }
              } else {
                if (createPortfolio.brokerFees) {
                  etfValueChange = ((amountInvestedPeriodically *
                              (pow((1 + effectiveETFGrowth), periods) - 1) /
                              effectiveETFGrowth) *
                          etfAllocation *
                          (createPortfolio.etfAllocationPercentage / 100)) -
                      createPortfolio.stockPurchaseFlatFee;
                } else {
                  etfValueChange = ((amountInvestedPeriodically *
                              (pow((1 + effectiveETFGrowth), periods) - 1) /
                              effectiveETFGrowth) *
                          etfAllocation) *
                      (createPortfolio.etfAllocationPercentage / 100);
                }
              }
              finalObjective =
                  (createPortfolio.monetaryObjective * etfValueChange) /
                      necesaryValue;
              singleAssetReturn.add(StockReturn(
                assetID: createPortfolio.etfs[i].id,
                finalValue: finalObjective,
              ));
            }
            etfValueChange = etfValueChange / 100;
            // Update the current portfolio value
            portfolioValueETFs += etfValueChange;
            currentPortfolioValue += etfValueChange;
          }
        }
        if (createPortfolio.includeBonds) {
          // Calculate total effective growth for all stocks
          for (int i = 0; i < createPortfolio.bonds.length; i++) {
            double couponRate = 0;

            // Calculate effective annual growth for the current stock
            if (createPortfolio.bonds[i].fwt && createPortfolio.taxation) {
              couponRate = (1 - (createPortfolio.fwt / 100)) *
                      (createPortfolio.bonds[i].couponRate / 100) -
                  (createPortfolio.bonds[i].couponRate / 100) *
                      (createPortfolio.dividendTax / 100);
            } else if (!createPortfolio.bonds[i].fwt &&
                createPortfolio.taxation) {
              couponRate = (createPortfolio.bonds[i].couponRate / 100) -
                  (createPortfolio.bonds[i].couponRate / 100) *
                      (createPortfolio.dividendTax / 100);
            } else if (createPortfolio.bonds[i].fwt &&
                !createPortfolio.taxation) {
              couponRate = (1 - (createPortfolio.fwt / 100)) *
                  (createPortfolio.bonds[i].couponRate / 100);
            } else {
              couponRate = (createPortfolio.bonds[i].couponRate / 100);
            }
            if (createPortfolio.brokerFees) {
              couponRate -= createPortfolio.stockPurchaseFee / 100;
              couponRate -= createPortfolio.accountMaintenanceFee / 100;
            }
            // Calculate the returns for the given period of the stock
            double bondAllocation =
                createPortfolio.bonds[i].bondAllocation / 100.0;
            double bondValueChange = 0;
            int couponAjustment = 0;
            double finalObjective = 0;
            if (frequency == 'Monthly' ||
                frequency == 'Quarterly' ||
                frequency == 'Annual' ||
                frequency == 'One-time') {
              int periods = 0;
              if (frequency == 'Monthly') {
                periods = 12 * createPortfolio.duration;
                couponAjustment = 12;
              } else if (frequency == 'Quarterly') {
                periods = 4 * createPortfolio.duration;
                couponAjustment = 4;
              } else if (frequency == 'Annual') {
                periods = createPortfolio.duration;
                couponAjustment = 1;
              } else if (frequency == 'One-time') {
                periods = min(createPortfolio.duration,
                    createPortfolio.bonds[i].maturityPeriod.toInt());
                couponAjustment = 1;
              }
              if (frequency == 'One-time') {
                if (createPortfolio.brokerFees) {
                  bondValueChange = (((amountInvestedPeriodically *
                                  pow((1 + (couponRate / couponAjustment)),
                                      periods)) +
                              (createPortfolio.bonds[i].faceValue *
                                  pow((1 + (couponRate / couponAjustment)),
                                      periods))) *
                          bondAllocation *
                          (createPortfolio.bondAllocationPercentage / 100)) -
                      createPortfolio.stockPurchaseFlatFee;
                } else {
                  bondValueChange = (((amountInvestedPeriodically *
                              pow((1 + (couponRate / couponAjustment)),
                                  periods)) +
                          (createPortfolio.bonds[i].faceValue *
                              pow((1 + (couponRate / couponAjustment)),
                                  periods))) *
                      bondAllocation *
                      (createPortfolio.bondAllocationPercentage / 100));
                }
              } else {
                if (createPortfolio.brokerFees) {
                  bondValueChange = ((amountInvestedPeriodically *
                          ((pow((1 + (couponRate / couponAjustment)),
                                      (periods)) -
                                  1 / (couponRate / couponAjustment)) +
                              (createPortfolio.bonds[i].faceValue *
                                  pow((1 + (couponRate / couponAjustment)),
                                      periods))) *
                          bondAllocation *
                          (createPortfolio.bondAllocationPercentage / 100)) -
                      createPortfolio.stockPurchaseFlatFee);
                } else {
                  bondValueChange = ((amountInvestedPeriodically *
                      ((pow((1 + (couponRate / couponAjustment)), (periods)) -
                              1 / (couponRate / couponAjustment)) +
                          (createPortfolio.bonds[i].faceValue *
                              pow((1 + (couponRate / couponAjustment)),
                                  periods))) *
                      bondAllocation *
                      (createPortfolio.bondAllocationPercentage / 100)));
                }
              }
              finalObjective =
                  (createPortfolio.monetaryObjective * bondValueChange) /
                      necesaryValue;
              singleAssetReturn.add(StockReturn(
                assetID: createPortfolio.bonds[i].id,
                finalValue: finalObjective,
              ));
            }
            bondValueChange = bondValueChange / 100;
            // Update the current portfolio value
            portfolioValueBonds += bondValueChange;
            currentPortfolioValue += bondValueChange;
          }
        }
        if (frequency == 'One-time') {
          totalAmountInvested = amountInvestedPeriodically;
        } else {
          totalAmountInvested =
              amountInvestedPeriodically * createPortfolio.duration;
        }
        avgAnualReturn = pow((currentPortfolioValue / totalAmountInvested),
                (1 / createPortfolio.duration)) -
            1;
        // Increment the amount invested for the next iteration
        amountInvestedPeriodically++;
      }
      allocationScore = calculateAllocationScore();
      diversificationScore = calculateDiversificationScore();
      durationScore = calculateDurationScore();
      returnScore = calculateReturnScore(avgAnualReturn);
      print(
          "Creating PortfolioReturn main values: $newportfolioID, $portfolioValueStocks, $portfolioValueETFs, $portfolioValueBonds, $currentPortfolioValue");
      realm.write(() => realm.add(PortfolioReturn(
            newportfolioID,
            allocationScore,
            totalAmountInvested,
            avgAnualReturn,
            bondAllocationPercentage,
            diversificationScore,
            createPortfolio.duration,
            durationScore,
            etfAllocationPercentage,
            portfolioValueBonds,
            portfolioValueETFs,
            portfolioValueStocks,
            currentPortfolioValue,
            frequency,
            createPortfolio.name,
            returnScore,
            calculateFinalScore(allocationScore, diversificationScore,
                durationScore, returnScore),
            stockAllocationPercentage,
            user.id,
          )));

      if (createPortfolio.includeStocks) {
        for (int i = 0; i < createPortfolio.stocks.length; i++) {
          double finalValue = 0;
          double periodInvestment = 0;
          double specificStockInvestment = 0;

          ObjectId assetID = ObjectId();
          periodInvestment = amountInvestedPeriodically *
              (createPortfolio.stockAllocationPercentage / 100) *
              (createPortfolio.stocks[i].stockAllocation / 100);

          specificStockInvestment = totalAmountInvested *
              (createPortfolio.stockAllocationPercentage / 100) *
              (createPortfolio.stocks[i].stockAllocation / 100);

          finalValue = singleAssetReturn
              .firstWhere(
                  (element) => element.assetID == createPortfolio.stocks[i].id)
              .finalValue;

          realm.write(() => realm.add(AssetReturn(
                assetID,
                finalValue,
                periodInvestment,
                createPortfolio.stocks[i].name,
                specificStockInvestment,
                user.id,
              )));
          addAssettoPortfolio(assetID);
        }
      }
      if (createPortfolio.includeETF) {
        for (int i = 0; i < createPortfolio.etfs.length; i++) {
          double finalValue = 0;
          double periodInvestment = 0;
          double specificETFInvestment = 0;

          ObjectId assetID = ObjectId();
          periodInvestment = amountInvestedPeriodically *
              (createPortfolio.etfAllocationPercentage / 100) *
              (createPortfolio.etfs[i].eTFAllocation / 100);

          specificETFInvestment = totalAmountInvested *
              (createPortfolio.etfAllocationPercentage / 100) *
              (createPortfolio.etfs[i].eTFAllocation / 100);

          finalValue = singleAssetReturn
              .firstWhere(
                  (element) => element.assetID == createPortfolio.etfs[i].id)
              .finalValue;

          realm.write(() => realm.add(AssetReturn(
                assetID,
                finalValue,
                periodInvestment,
                createPortfolio.etfs[i].name,
                specificETFInvestment,
                user.id,
              )));
          addAssettoPortfolio(assetID);
        }
      }
      if (createPortfolio.includeBonds) {
        for (int i = 0; i < createPortfolio.bonds.length; i++) {
          double finalValue = 0;
          double periodInvestment = 0;
          double specificBondInvestment = 0;

          ObjectId assetID = ObjectId();
          periodInvestment = amountInvestedPeriodically *
              (createPortfolio.bondAllocationPercentage / 100) *
              (createPortfolio.bonds[i].bondAllocation / 100);

          specificBondInvestment = totalAmountInvested *
              (createPortfolio.bondAllocationPercentage / 100) *
              (createPortfolio.bonds[i].bondAllocation / 100);

          finalValue = singleAssetReturn
              .firstWhere(
                  (element) => element.assetID == createPortfolio.bonds[i].id)
              .finalValue;

          realm.write(() => realm.add(AssetReturn(
                assetID,
                finalValue,
                periodInvestment,
                createPortfolio.bonds[i].name,
                specificBondInvestment,
                user.id,
              )));
          addAssettoPortfolio(assetID);
        }
      }
    } catch (e) {
      print("Exapetion reached: $e");
      endedCalculations = 2;
      return;
    }
    endedCalculations = 1;
  }

  int getEndedCalculations() {
    return endedCalculations;
  }

  void addAssettoPortfolio(ObjectId assetID) {
    AssetReturn asset = realm.query<AssetReturn>('id == \$0', [assetID]).first;
    PortfolioReturn portfolio =
        realm.query<PortfolioReturn>('id == \$0', [newportfolioID]).first;

    realm.write(() => portfolio.assets.add(asset));
  }

  double calculateAllocationScore() {
    // Calculate the weighted score for each value
    double score1 = createPortfolio.stockAllocationPercentage * 0.2;
    double score2 = createPortfolio.etfAllocationPercentage * 0.9;
    double score3 = createPortfolio.bondAllocationPercentage * 1.6;

    // Calculate the overall score
    double overallScore = score1 + score2 + score3;

    // Return the overall score, capped at 100
    return overallScore.clamp(0, 100);
  }

  double calculateDiversificationScore() {
    // Calculate the weighted score for each value
    int totalAssets = 0;
    totalAssets += createPortfolio.stocks.length;
    totalAssets += createPortfolio.etfs.length;
    totalAssets += createPortfolio.bonds.length;

    if (totalAssets <= 0) {
      return 0;
    } else if (totalAssets >= 10) {
      return 100;
    } else {
      // Calculate linearly interpolated value between 0 and 1
      return totalAssets * 10;
    }
  }

  double calculateDurationScore() {
    if (createPortfolio.duration == 1) {
      return 10.0;
    } else if (createPortfolio.duration >= 20) {
      return 100.0;
    } else {
      return createPortfolio.duration * 5.0;
    }
  }

  double calculateReturnScore(double avgAnualReturn) {
    double avgReturn = avgAnualReturn * 100;
    if (avgReturn <= 0) {
      return 0.0;
    } else if (avgReturn >= 20) {
      return 100.0;
    } else {
      return avgReturn * 5;
    }
  }

  int calculateFinalScore(
      double value1, double value2, double value3, double value4) {
    double score =
        (value1 * 0.25) + (value2 * 0.25) + (value3 * 0.25) + (value4 * 0.25);

    // Return the score as an integer
    return score.round();
  }
}
