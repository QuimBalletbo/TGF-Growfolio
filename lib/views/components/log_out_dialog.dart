import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_bottom_part.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 370.h,
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 44.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 285.h,
                  margin: EdgeInsets.only(right: 42.h),
                  child: Text("Are you sure you want to Log Out?",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat)),
              SizedBox(height: 73.v),
              CustomElevatedButton(
                  text: "Cancel",
                  buttonStyle: CustomButtonStyles.fillGray,
                  onPressed: () {
                    onTapCancel(context);
                  }),
              SizedBox(height: 42.v),
              CustomElevatedButton(
                  text: "Log Out ",
                  buttonStyle: CustomButtonStyles.fillDeepOrange,
                  onPressed: () {
                    onTapLogOut(context);
                  }),
              SizedBox(height: 22.v)
            ]));
  }

  /// Shows a modal bottom sheet with [PGinaDIniciAlumneBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapCancel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => PGinaDIniciAlumneBottomsheet(),
        isScrollControlled: true);
  }

  /// Navigates to the iniciarSessiRegistrarSeScreen when the action is triggered.
  onTapLogOut(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iniciarSessiRegistrarSeScreen);
  }
}
