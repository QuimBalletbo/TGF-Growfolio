class CreatePortfolioViewController {
  String portfolioName = '';
  double monetaryAmount = 0;
  int duration = 0;
  String frequencyInvesting = '';
  bool taxation = false;
  bool brokerFees = false;
  bool rebalancing = false;

  setPortfolioName(String value) {
    portfolioName = value;
  }

  setMonetaryAmount(double value) {
    monetaryAmount = value;
  }

  setDuration(int value) {
    duration = value;
  }

  setFrequencyInvesting(String value) {
    frequencyInvesting = value;
  }

  setTaxation(bool value) {
    taxation = value;
  }

  setBrokerFees(bool value) {
    brokerFees = value;
  }

  setRebalancing(bool value) {
    rebalancing = value;
  }
}
