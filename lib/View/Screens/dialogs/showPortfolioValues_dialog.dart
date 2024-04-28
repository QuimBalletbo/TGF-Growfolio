import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/showPortfolioValues_dialog_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/bond_conf_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_PortfolioReturnCard.dart';

class PortfolioValuesDialog extends StatefulWidget {
  PortfolioValuesDialog({
    Key? key,
  }) : super(key: key);

  @override
  _CreateBondConfigurationDialogState createState() =>
      _CreateBondConfigurationDialogState();
}

class _CreateBondConfigurationDialogState extends State<PortfolioValuesDialog> {
  late CreatePortfolioValues controller =
      CreatePortfolioValues(); // Initialize the controller field

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
      decoration: AppDecoration.outlinePrimary8.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 6.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: controller.allPortfolioReturn.isEmpty
                ? [
                    // Display message when there are no portfolios
                    Container(
                        margin: EdgeInsets.only(right: 42.h),
                        alignment: Alignment.centerRight,
                        child: Text("There are currently no Bonds",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleLargeMontserrat)),
                  ]
                : [
                    // Render portfolios if available BondPortfolio
                    ...controller.allPortfolioReturn.map(
                      (portfolios) => Column(
                        children: [
                          customPortfolioReturnCard(
                              portfolios, controller.singlePortfolio, () {
                            setState(() {}); // Update the UI
                          }),
                          const SizedBox(height: 31),
                        ],
                      ),
                    ),
                  ],
          ),
        ],
      ),
    ));
  }
}
