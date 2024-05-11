import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/show_return_1_dialog.dart';
import 'package:flutter_application_1/View/widgets/BlueArrowBack.dart';
import 'package:flutter_application_1/Controller/Views_Controller/show_return_1_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';

class ShowReturnView1 extends StatefulWidget {
  ShowReturnView1({Key? key}) : super(key: key);
  ShowReturnView1Controller viewController = ShowReturnView1Controller();

  @override
  _ShowReturnView1State createState() => _ShowReturnView1State();
}

class _ShowReturnView1State extends State<ShowReturnView1> {
  @override
  void initState() {
    super.initState();
    portfolioName = widget.viewController.initViewData();
  }

  String portfolioName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  text: 'Individual Asset Overview',
                  title: portfolioName,
                ), // Placing the app bar here
                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.59),
                  child: ShowReturnDialog1(),
                ),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Return to Home",
                  onTap: () {
                    onTapHome(context);
                  },
                ),

                SizedBox(height: 16.v),

                // Form Content
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

  /// Section Widget
}
