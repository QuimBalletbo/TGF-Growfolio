import 'dart:ffi';

import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class ShowReturnView1Controller {
  Profile profile = AuthService().getProfile();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late PortfolioReturn portfolio;
  String portfolioName = '';
  String frequencyInvesting = '';
  double amountInvested = 0;
  double finalportfolioValue = 0;

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
}
