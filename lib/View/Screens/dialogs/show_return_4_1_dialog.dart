import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_AssetList_3.dart';
import 'package:flutter_application_1/View/widgets/textInformation.dart';

// ignore_for_file: must_be_immutable
class ShowReturn4Dialog extends StatefulWidget {
  ShowReturn4Dialog({Key? key}) : super(key: key);
  ShowReturnView1Controller controller = ShowReturnView1Controller();

  @override
  _ShowReturn4DialogState createState() => _ShowReturn4DialogState();
}

class _ShowReturn4DialogState extends State<ShowReturn4Dialog> {
  @override
  void initState() {
    super.initState();
    widget.controller.initViewData();
    durationScore = widget.controller.getDurationScore();
    diversaificationScore = widget.controller.getDiversaificationScore();
    returnScore = widget.controller.getReturnScore();
    allocationScore = widget.controller.getAllocationScore();
    score = widget.controller.getScore();
  }

  int score = 0;
  double durationScore = 0;
  double diversaificationScore = 0;
  double returnScore = 0;
  double allocationScore = 0;

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
                    text: 'portfolio',
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
                      children: [
                        // Render portfolios if available ETFPortfolio
                        CustomAssetList2(
                          amount: allocationScore,
                          name: "allocationScore",
                        ),
                        const Divider(
                          indent: 4.0,
                          endIndent: 4.0,
                        ),
                        CustomAssetList2(
                          amount: returnScore,
                          name: "returnScore",
                        ),
                        const Divider(
                          indent: 4.0,
                          endIndent: 4.0,
                        ),
                        CustomAssetList2(
                          amount: diversaificationScore,
                          name: "diversaificationScore",
                        ),
                        const Divider(
                          indent: 4.0,
                          endIndent: 4.0,
                        ),
                        CustomAssetList2(
                          amount: durationScore,
                          name: "durationScore",
                        ),
                        const Divider(
                          indent: 4.0,
                          endIndent: 4.0,
                        ),
                      ]),
                ])));
  }
}
