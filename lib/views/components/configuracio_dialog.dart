import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ConfiguraciDialog extends StatelessWidget {
  const ConfiguraciDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return _buildDescriptionRow(context);
  }

  /// Section Widget
  Widget _buildDescriptionRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 26.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 272.h,
              margin: EdgeInsets.symmetric(vertical: 10.v),
              child: Text(
                "TERMS AND CONDITIONS\nLast updated December 08, 2023\nAGREEMENT TO OUR LEGAL TERMS\nWe are La Salle Campus Barcelona-URL, a private educational institution registered in Spain at C/ de Sant Joan de la Salle, 42, , Barcelona, Spain/Catalonia/Barcelona 08017.\nWe operate the mobile application Compound (the 'App'), as well as any other related products and services that refer or link to these legal terms (the 'Legal Terms') (collectively, the 'Services').\nThe app is a portfolio management tool created for educational purposes only. It offers users a platform to track and optimize their investments across various asset classes, including stocks, bonds, and ETFs. However, please note that this app does not engage in actual trading or include any built-in monetization features. Its primary focus is to educate and assist users in managing their portfolios effectively.\"\nYou can contact us by phone at 608771866, email at joaquim.balletbo@students.salle.url.edu, or by mail to C/ de Sant Joan de la Salle, 42, Barcelona, Spain/Catalonia/Barcelona 08017, Spain.\nThese Legal Terms constitute a legally binding agreement made between you, whether personally or on behalf of an entity ('you'), and La Salle Campus Barcelona-URL, concerning your access to and use of the Services. You agree that by accessing the Services, you have read, understood, and agreed to be bound by all these Legal Terms. IF YOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST DISCONTINUE USE IMMEDIATELY.Supplemental terms and conditions or documents that may be posted on the Services from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Legal Terms from time to time. We will alert you about any changes by updating the 'Last updated' date of these Legal Terms, and you waive any right to receive specific notice of each such change. It is your responsibility to periodically review these Legal Terms to stay informed of updates. You will be subject to and ",
                maxLines: 43,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallRegular,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 37.h),
            child: SizedBox(
              height: 550.v,
              child: VerticalDivider(
                width: 6.h,
                thickness: 6.v,
                color: appTheme.blueGray8003d,
                endIndent: 406.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
