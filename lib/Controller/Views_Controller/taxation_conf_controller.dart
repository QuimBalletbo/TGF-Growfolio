class CreateTaxationConfigurationViewController {
  String taxation = '';
  double taxaRateShortTerm = 0;
  double taxaRateLongtTerm = 0;
  int shortToLongTransition = 0;
  double dividendTax = 0;
  double fwt = 0;

  setTaxation(String value) {
    taxation = value;
  }

  setTaxaRateShortTerm(double value) {
    taxaRateShortTerm = value;
  }

  setTaxaRateLongtTerm(double value) {
    taxaRateLongtTerm = value;
  }

  setShortToLongTransition(int value) {
    shortToLongTransition = value;
  }

  setDividendTax(double value) {
    dividendTax = value;
  }

  setFwt(double value) {
    fwt = value;
  }
}
