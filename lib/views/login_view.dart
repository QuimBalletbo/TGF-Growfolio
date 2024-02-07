import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable

class IniciarSessiRegistrarSeScreen extends StatelessWidget {
  IniciarSessiRegistrarSeScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            height: SizeUtils.height,
                            width: double.maxFinite,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 57.v),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ImageConstant.imglogIn),
                                              fit: BoxFit.cover)),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 28.v),
                                            Text("GrowFolio",
                                                style: theme
                                                    .textTheme.displayLarge),
                                            SizedBox(height: 32.v),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 98.h),
                                                    child: Text(
                                                        "Log in to your account",
                                                        style: CustomTextStyles
                                                            .bodyMediumInterWhiteA700))),
                                            const Spacer(),
                                            _buildEmailSection(context),
                                            SizedBox(height: 67.v),
                                            RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "Don’t have an account? ",
                                                      style: CustomTextStyles
                                                          .bodyMediumInterff1e1e1e),
                                                  TextSpan(
                                                      text: "Create Account",
                                                      style: CustomTextStyles
                                                          .bodyMediumInterff00000014
                                                          .copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline))
                                                ]),
                                                textAlign: TextAlign.left)
                                          ])))
                            ])))))));
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 13.v),
        decoration: AppDecoration.outlinePrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 12.v),
          CustomTextFormField(
              controller: emailController,
              hintText: "Enter email id",
              hintStyle: theme.textTheme.bodyMedium!,
              textInputType: TextInputType.emailAddress),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: passwordController,
              hintText: "Enter password",
              hintStyle: theme.textTheme.bodyMedium!,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              obscureText: true),
          SizedBox(height: 5.v),
          Align(
              alignment: Alignment.centerRight,
              child: Text("Forget Password ?",
                  style: CustomTextStyles.bodyMediumPrimary)),
          SizedBox(height: 23.v),
          CustomElevatedButton(
            text: "Login",
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB888), // FFB888 color
              foregroundColor: Colors.black, // Text color
              // Add other properties as needed
            ),
            onPressed: () {
              onTapLogin(context);
            },
          ),
          SizedBox(height: 35.v),
          Padding(
              padding: EdgeInsets.only(left: 19.h, right: 11.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 9.v, bottom: 6.v),
                        child: SizedBox(
                            width: 105.h,
                            child: Divider(color: appTheme.gray500))),
                    Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text("Or sign up with",
                            style: CustomTextStyles
                                .bodySmallOutfitSecondaryContainer)),
                    Padding(
                        padding: EdgeInsets.only(top: 9.v, bottom: 6.v),
                        child: SizedBox(
                            width: 109.h,
                            child:
                                Divider(color: appTheme.gray500, indent: 4.h)))
                  ])),
          SizedBox(height: 33.v),
          Container(
              height: 48.v,
              width: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 9.v),
              decoration: AppDecoration.outlineGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Image.asset(
                ImageConstant.imgGoogleLogo,
                height: 27.adaptSize,
                width: 27.adaptSize,
                alignment: Alignment.center,
              ))
        ]));
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }
}
