import 'package:flutter_application_1/Model/listCreatePortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'dart:math';

class CalculatePortfolioController {
  CreatePortfolio createPortfolio = AuthService().getCreatePortfolio();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  double calculateStockReturn() {
    String frequency = createPortfolio.frequencyInvesting;

    // Initialize the amount invested and current portfolio value
    double amountInvested = 0;
    double currentPortfolioValue = 0;
    double amountWithBrokerFee = 0;
    double necesaryValue = 0;
    double accountMaintenanceFlatFee = 0;
    double amountWithTaxation = 0;

    // Calculate flat fee and amount with tax based on portfolio settings
    if (createPortfolio.brokerFees) {
      amountWithBrokerFee = (createPortfolio.monetaryObjective *
              (1 + (createPortfolio.stockSaleFee / 100))) +
          createPortfolio.stockSaleFlatFee;
      accountMaintenanceFlatFee = createPortfolio.accountMaintenanceFlatFee;
    } else {
      amountWithBrokerFee = createPortfolio.monetaryObjective;
    }
    if (createPortfolio.taxation &&
        createPortfolio.shortToLongTransition < createPortfolio.duration) {
      amountWithTaxation =
          amountWithBrokerFee * (1 + createPortfolio.taxRateShortTerm / 100);
    }
    if (createPortfolio.taxation &&
        createPortfolio.shortToLongTransition > createPortfolio.duration) {
      amountWithTaxation =
          amountWithBrokerFee * (1 + createPortfolio.taxRateLongTerm / 100);
    } else {
      amountWithTaxation = amountWithBrokerFee;
    }

    necesaryValue = amountWithTaxation +
        (accountMaintenanceFlatFee * createPortfolio.duration);

    // Iterate until the current portfolio value reaches or exceeds the monetary objective
    while (currentPortfolioValue < necesaryValue) {
      if (createPortfolio.includeStocks) {
        // Calculate total effective growth for all stocks
        for (int i = 0; i < createPortfolio.stocks.length; i++) {
          double effectiveAnualGrowth = 0;
          double effectiveGrowth = 0;

          // Calculate effective annual growth for the current stock
          if (createPortfolio.stocks[i].fwt && createPortfolio.taxation) {
            effectiveAnualGrowth = (1 - (createPortfolio.fwt / 100)) *
                    (createPortfolio.stocks[i].avgReturn / 100) +
                ((createPortfolio.stocks[i].avgDividend / 100) -
                    createPortfolio.dividendTax / 100);
          }
          if (!createPortfolio.stocks[i].fwt && createPortfolio.taxation) {
            effectiveAnualGrowth = (createPortfolio.stocks[i].avgReturn / 100) +
                ((createPortfolio.stocks[i].avgDividend / 100) -
                    createPortfolio.dividendTax / 100);
          } else {
            effectiveAnualGrowth = (createPortfolio.stocks[i].avgReturn / 100) +
                (createPortfolio.stocks[i].avgDividend / 100);
          }
          if (createPortfolio.brokerFees) {
            effectiveAnualGrowth -= createPortfolio.stockPurchaseFee / 100;
            effectiveAnualGrowth -= createPortfolio.accountMaintenanceFee / 100;
          }

          // Calculate effective growth based on frequency of investing
          effectiveGrowth = effectiveAnualGrowth;

          // Calculate the returns for the given period of the stock
          double stockAllocation =
              createPortfolio.stocks[i].stockAllocation / 100.0;
          double stockValueChange = 0;
          if (frequency == 'Monthly' ||
              frequency == 'Quarterly' ||
              frequency == 'Annual') {
            int periods = 0;
            if (frequency == 'Monthly') {
              periods = 12 * createPortfolio.duration;
            } else if (frequency == 'Quarterly') {
              periods = 4 * createPortfolio.duration;
            } else if (frequency == 'Annual') {
              periods = createPortfolio.duration;
            }
            if (createPortfolio.brokerFees) {
              stockValueChange = (amountInvested *
                          (pow((1 + effectiveGrowth), periods) - 1) /
                          effectiveGrowth) *
                      stockAllocation -
                  createPortfolio.stockPurchaseFlatFee;
            } else {
              stockValueChange = (amountInvested *
                      (pow((1 + effectiveGrowth), periods) - 1) /
                      effectiveGrowth) *
                  stockAllocation;
            }
          }

          // Update the current portfolio value
          currentPortfolioValue += stockValueChange;
        }

        // Increment the amount invested for the next iteration
        amountInvested++;
      }

      return amountInvested;
    }
    return 0;
  }
}
