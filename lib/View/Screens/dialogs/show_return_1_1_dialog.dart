import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/textInformation.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/View/widgets/custom_AssetCard.dart';

// ignore_for_file: must_be_immutable
class ShowReturn1Dialog extends StatefulWidget {
  ShowReturn1Dialog({Key? key}) : super(key: key);
  ShowReturnView1Controller controller = ShowReturnView1Controller();

  @override
  _ShowReturn1DialogState createState() => _ShowReturn1DialogState();
}

class _ShowReturn1DialogState extends State<ShowReturn1Dialog> {
  @override
  void initState() {
    super.initState();
    frequencyInvesting = widget.controller.getFrequencyInvesting();
    assetList = widget.controller.getAssets();
  }

  String frequencyInvesting = "";
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
                  NameTitleText(
                    text: frequencyInvesting,
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
