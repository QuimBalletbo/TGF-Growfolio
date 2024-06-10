import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/textNumbersInformation.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_AssetList_2.dart';

// ignore_for_file: must_be_immutable
class ShowReturnBreakDownDialog extends StatefulWidget {
  ShowReturnBreakDownDialog({Key? key}) : super(key: key);
  ShowReturnView1Controller controller = ShowReturnView1Controller();

  @override
  _ShowReturnBreakDownDialogState createState() =>
      _ShowReturnBreakDownDialogState();
}

class _ShowReturnBreakDownDialogState extends State<ShowReturnBreakDownDialog> {
  @override
  void initState() {
    super.initState();
    totalAmountInvested = widget.controller.getAmountInvested();
    amountInvestedStock = widget.controller.getAmountInvestedStock();
    amountInvestedETF = widget.controller.getAmountInvestedETF();
    amountInvestedBond = widget.controller.getAmountInvestedBond();
    avgReturn = widget.controller.getFinalavgReturn();
  }

  double totalAmountInvested = 0;
  double amountInvestedStock = 0;
  double amountInvestedETF = 0;
  double amountInvestedBond = 0;
  double avgReturn = 0;

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
                    text: totalAmountInvested.toStringAsFixed(2),
                    value: 4,
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
                          amount: amountInvestedStock,
                          name: "Total Stock Investment",
                          isPercentage: false,
                        ),
                        const Divider(
                          indent: 4.0,
                          endIndent: 4.0,
                        ),
                        CustomAssetList2(
                          amount: amountInvestedETF,
                          name: "Total ETF Investment",
                          isPercentage: false,
                        ),
                        const Divider(
                          indent: 4.0,
                          endIndent: 4.0,
                        ),
                        CustomAssetList2(
                          amount: amountInvestedBond,
                          name: "Total Bond Investment",
                          isPercentage: false,
                        ),
                        const Divider(
                          indent: 4.0,
                          endIndent: 4.0,
                        ),
                        CustomAssetList2(
                          amount: avgReturn,
                          name: "avg Anual Return",
                          isPercentage: true,
                        ),
                      ]),
                ])));
  }
}
