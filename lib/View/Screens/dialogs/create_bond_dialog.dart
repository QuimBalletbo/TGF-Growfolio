import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_%.dart';
import 'package:flutter_application_1/View/widgets/custom_toggle_button.dart';
import 'package:flutter_application_1/View/widgets/name_title_text.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/create_bond_dialog_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/rateDate.dart';

class CreateBondDialog extends StatefulWidget {
  CreateBondDialog({Key? key}) : super(key: key);
  CreateBondController controller = CreateBondController();

  @override
  _CreateBondDialogState createState() => _CreateBondDialogState();
}

class _CreateBondDialogState extends State<CreateBondDialog> {
  BondController controller = BondController();
  String bondName = '';
  bool includeFWT = false;
  int bondAllocation = 0;
  double faceValue = 0;
  double couponRate = 0;
  double maturityDate = 0;

  bool errorBondAllocation = false;
  bool errorBondName = false;
  bool errorFieldEmpty = false;
  bool errorFaceValue = false;
  bool errorCouponRate = false;

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
          NameTitleText(
            title: "Bond Name",
            name: "Bond ",
            controller: controller.bondNameController,
            onPortfolioNameChanged: (value) {
              setState(() {
                errorBondName = widget.controller.validateBondName(value);
                bondName =
                    widget.controller.getBondNameValue(value, errorBondName);
              });
            },
          ),
          const SizedBox(height: 6.0),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorBondName,
              child: Text(
                "Invalid format. Please enter a valid Bond name (3-20 characters, no special characters).",
                style: errorBondName
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Divider(
            color: appTheme.deepOrange200,
            indent: 4.0,
            endIndent: 4.0,
          ),
          const SizedBox(height: 6.0),
          EnterTextEuros(
            text: "Face Value (Par Value)",
            defaultText: "€",
            controller: controller.faceValue,
            onTextChanged: (value) {
              setState(() {
                errorFaceValue =
                    widget.controller.checkFaceValueValidity(value);
                faceValue =
                    widget.controller.getDoubleValue(value, errorFaceValue);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorFaceValue,
              child: Text(
                "Invalid format. Please enter a valid number between 100 and 10000.",
                style: errorFaceValue
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          EnterTextEuros(
            text: "Coupon Rate (as a % of the bond's face value )",
            defaultText: "%",
            controller: controller.couponRate,
            onTextChanged: (value) {
              setState(() {
                errorCouponRate = widget.controller.checkDoubleValidity(value);
                couponRate =
                    widget.controller.getDoubleValue(value, errorCouponRate);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorCouponRate,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorCouponRate
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
            padding: EdgeInsets.only(left: 2.0, right: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RateDate(
                  text: "Maturity Date (years untill maturity)",
                  defaultText: " years",
                  onNumberChanged: (value) {
                    setState(() {
                      maturityDate =
                          widget.controller.getDoubleValue(value, false);
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          ToggleButton(
            text: "Include Foreign Withholding Tax",
            onToggleChanged: (value) {
              setState(() {
                includeFWT = widget.controller.getIncludeFWT(value);
              });
            },
          ),
          const SizedBox(height: 6.0),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected that the Bonds will not be equally weighted.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          EnterTextPercentage(
            text: "Bond Allocation (%) of total Bonds",
            defaultText: "%",
            controller: controller.enterTextController,
            onTextChanged: (value) {
              setState(() {
                errorBondAllocation =
                    widget.controller.checkIntegerValidity(value);
                bondAllocation = widget.controller
                    .getBondAllocation(value, errorBondAllocation);
              });
            },
          ),
          Align(
            alignment: Alignment.topLeft,
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
          Align(
            alignment: Alignment.topLeft,
            child: Visibility(
              visible: errorFieldEmpty,
              child: Text(
                "Invalid format. one or more fields are empty. Please fill in all fields and try again",
                style: errorFieldEmpty
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          CustomSpaceButton(
            text: "Save Bond",
            onTap: () {
              onTapContinue(context);
            },
          ),
        ],
      ),
    ));
  }

  onTapContinue(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.controller.createBond(bondName, includeFWT,
          bondAllocation, faceValue, couponRate, maturityDate);
      if (errorFieldEmpty == false) {
        Navigator.pushNamed(context, AppRoutes.bondConfigurationScreen);
      }
    });
  }
}
