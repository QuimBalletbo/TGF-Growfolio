import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/views/components/log_in_dialog.dart';

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
                                            LogInDialog(),
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
}
