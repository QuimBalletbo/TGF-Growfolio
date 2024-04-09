class CreateBrokerFeesController {
  String selection = '';
  double stockPurchaseFee = 0;
  double stockPurchaseFlatFee = 0;
  double stockSaleFee = 0;
  double stockSaleFlatFee = 0;
  double accountMantainanceFee = 0;
  double accountMantainanceFlatFee = 0;

  setSelection(String value) {
    selection = value;
  }

  setStockPurchaseFee(double value) {
    stockPurchaseFee = value;
  }

  setStockPurchaseFlatFee(double value) {
    stockPurchaseFlatFee = value;
  }

  setStockSaleFee(double value) {
    stockSaleFee = value;
  }

  setStockSaleFlatFee(double value) {
    stockSaleFlatFee = value;
  }

  setAccountMantainanceFee(double value) {
    accountMantainanceFee = value;
  }

  setAccountMantainanceFlatFee(double value) {
    accountMantainanceFlatFee = value;
  }
}
