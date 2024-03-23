import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_bottom_part.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Controller/Views_Controller/log_out_controller.dart';

class LogOutDialog extends StatelessWidget {
  LogOutDialog({Key? key}) : super(key: key);

  final LogoutController _controller = LogoutController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.h,
      padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 44.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 285.h,
            margin: EdgeInsets.only(right: 42.h),
            child: Text(
              "Are you sure you want to Log Out?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleLargeMontserrat,
            ),
          ),
          SizedBox(height: 73.v),
          CustomElevatedButton(
            text: "Cancel",
            buttonStyle: CustomButtonStyles.fillGray,
            onPressed: () => _controller.onTapCancel(context),
          ),
          SizedBox(height: 42.v),
          CustomElevatedButton(
            text: "Log Out",
            buttonStyle: CustomButtonStyles.fillDeepOrange,
            onPressed: () => _controller.onTapLogOut(context),
          ),
          SizedBox(height: 22.v),
        ],
      ),
    );
  }
}
