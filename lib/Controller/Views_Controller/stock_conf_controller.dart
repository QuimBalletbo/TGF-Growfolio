class CreateStockConfController {
  bool includeStocks = false;
  bool equallyWeightedStocks = false;
  double stockAllocation = 0;

  setIncludeStocks(bool value) {
    includeStocks = value;
  }

  setEquallyWeightedStocks(bool value) {
    equallyWeightedStocks = value;
  }

  setStockAllocation(double value) {
    stockAllocation = value;
  }
}
