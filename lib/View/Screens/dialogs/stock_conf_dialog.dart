import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';

class StockConfigurationDialog extends StatelessWidget {
  const StockConfigurationDialog({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Stock Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "Exclude individual stocks from your portfolio",
            text_2: "Include individual stocks in your portfolio.",
          ),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected to include individual stocks in your portfolio. ",
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
              "Equally Weighted Stock Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "All stocks will be equally weighted",
            text_2: "The stocks will not be equally weighted",
          ),
          // segurament ho hare de canviar pk les comprvacions han de fer que sugui un numero del 0 al 100 i aquest widget ha de permetre numeros més alts
          EnterTextEuros(
              text: "Stock Allocation (%)  of total portfolio",
              defaultText: "%"),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Your Stock Selections",
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    ));
  }
}
