import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/bond_conf_dialog_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/bond_conf_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_BondCard.dart';

class BondConfigurationDialog extends StatefulWidget {
  final CreateBondConfController viewController;
  BondConfigurationDialog({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  _CreateBondConfigurationDialogState createState() =>
      _CreateBondConfigurationDialogState();
}

class _CreateBondConfigurationDialogState
    extends State<BondConfigurationDialog> {
  late CreateBondConfiguration controller;

  @override
  void initState() {
    super.initState();
    controller = CreateBondConfiguration(
      viewController: widget.viewController,
    );
  }

  CreateBondConfigurationController dialogController =
      CreateBondConfigurationController();

  bool errorBondAllocation = false;
  @override
  Widget build(BuildContext context) {
    bool includeBonds = controller.initateIncludeBonds();
    String includeBondstoText = controller.getIncludeBondsString(includeBonds);
    String equalWeightBonds = controller.initiateEqualWeightBonds();
    double bondAllocation = controller.initiateBondAllocation();
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Bond Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "Exclude Bonds from your portfolio",
            text_2: "Include Bonds in your portfolio.",
            onSelectionChanged: (value) {
              setState(() {
                includeBonds = controller.getIncludeBonds(value);
              });
            },
            initialSelection: includeBondstoText,
          ),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected to include Bonds in your portfolio. ",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Equally Weighted Bond Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "All Bonds will be equally weighted.",
            text_2: "The Bonds will not be equally weighted",
            onSelectionChanged: (value) {
              setState(() {
                equalWeightBonds = controller.getEquallyWeightedBonds(value);
              });
            },
            initialSelection: equalWeightBonds,
          ),
          EnterTextEuros(
            text: "Bond Allocation (%)  of total portfolio",
            defaultText: "%",
            controller: dialogController.bondAllocation,
            onTextChanged: (value) {
              setState(() {
                errorBondAllocation = controller.checkDoubleValidity(value);
                bondAllocation =
                    controller.getBondAllocation(value, errorBondAllocation);
              });
            },
            initialSelection: bondAllocation.toString(),
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorBondAllocation,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorBondAllocation
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Your Bond Selections",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 6.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: controller.bondPortfolio.bonds.isEmpty
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
                    ...controller.bondPortfolio.bonds.map(
                      (bonds) => Column(
                        children: [
                          customBondCard(bonds, controller.singleBond, () {
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
