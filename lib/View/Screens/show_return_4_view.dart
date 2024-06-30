import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/show_return_4_1_dialog.dart';
import 'package:flutter_application_1/View/Screens/dialogs/show_return_4_2_dialog.dart';
import 'package:flutter_application_1/View/widgets/BlueArrowBack.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';

class ShowReturnView4 extends StatefulWidget {
  ShowReturnView4({Key? key}) : super(key: key);
  ShowReturnView1Controller viewController = ShowReturnView1Controller();

  @override
  _ShowReturnView1State createState() => _ShowReturnView1State();
}

class _ShowReturnView1State extends State<ShowReturnView4> {
  @override
  void initState() {
    super.initState();
    portfolioName = widget.viewController.initViewData();
  }

  String portfolioName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // AppBar
                ArrowBackIosColumn(
                  text: 'Portfolio  Evaluation',
                  title: portfolioName,
                  position: 4,
                ), // Placing the app bar here
                SizedBox(height: 22.v),
                ShowReturnGraphicDialog(),

                SizedBox(height: 22.v),
                ShowReturn4Dialog(),

                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Return to Home",
                  onTap: () {
                    onTapHome(context);
                  },
                ),

                SizedBox(height: 16.v),
                CustomSpaceButton(
                  text: "Go Back",
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
                  onTap: () {
                    onTapGoBack(context);
                  },
                ),
                SizedBox(height: 22.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
