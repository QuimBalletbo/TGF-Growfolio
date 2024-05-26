import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/textNumbersInformation.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/View/widgets/customAssetList2.dart';

// ignore_for_file: must_be_immutable
class ShowReturn3Dialog extends StatefulWidget {
  ShowReturn3Dialog({Key? key}) : super(key: key);
  ShowReturnView1Controller controller = ShowReturnView1Controller();

  @override
  _ShowReturn3DialogState createState() => _ShowReturn3DialogState();
}

class _ShowReturn3DialogState extends State<ShowReturn3Dialog> {
  @override
  void initState() {
    super.initState();
    finalportfolioValue = widget.controller.getFinalportfolioValue();
    assetList = widget.controller.getAssets();
  }

  double finalportfolioValue = 0;
  late RealmList<AssetReturn> assetList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(right: 1.h),
            padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
            decoration: AppDecoration.fillWhiteA
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNumberInfo(
                    text: finalportfolioValue.toStringAsFixed(2),
                    value: 0,
                  ),
                  const SizedBox(height: 6.0),
                  Divider(
                    color: appTheme.deepOrange200,
                    indent: 4.0,
                    endIndent: 4.0,
                  ),
                  SizedBox(height: 20.v),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: assetList.isEmpty
                        ? []
                        : [
                            // Render portfolios if available ETFPortfolio
                            ...assetList.map(
                              (assetList) => Column(
                                children: [
                                  CustomAssetList(
                                    asset: assetList,
                                    totalAmount: finalportfolioValue,
                                    value: 0,
                                  ),
                                  const Divider(
                                    indent: 4.0,
                                    endIndent: 4.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                  ),
                ])));
  }
}
