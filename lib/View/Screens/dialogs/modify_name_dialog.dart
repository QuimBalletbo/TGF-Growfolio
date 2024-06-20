import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_bottom_part.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/modify_name_dialog_controller.dart';

// ignore_for_file: must_be_immutable
class ModifyNameDialog extends StatefulWidget {
  final ModifyNameController controller;

  ModifyNameDialog({Key? key})
      : controller = ModifyNameController(),
        super(key: key);
  @override
  _ModifyNameDialogState createState() => _ModifyNameDialogState();
}

class _ModifyNameDialogState extends State<ModifyNameDialog> {
  ModifyNameTextController textController = ModifyNameTextController();
  String password = '';
  String name = '';
  bool errorName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 14.h),
                  child: Text("Name",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat)),
              SizedBox(height: 26.v),
              CustomTextFormField(
                controller: textController.nameController,
                hintText: "enter name",
                hintStyle: theme.textTheme.bodyMedium!,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress,
                onEditingComplete: () {
                  setState(() {
                    name = textController.nameController.text;
                  });
                },
              ),
              SizedBox(height: 22.v),
              CustomElevatedButton(
                  text: "Cancel",
                  buttonStyle: CustomButtonStyles.fillGray,
                  onPressed: () {
                    onTapCancel(context);
                  }),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                  text: "Modify Name",
                  buttonStyle: CustomButtonStyles.fillDeepOrange,
                  onPressed: () {
                    setState(() {
                      widget.controller.onTapChangeName(context, name);

                      errorName = widget.controller.getNameError();
                    });
                  }),
              SizedBox(height: 5.v),
              Padding(
                padding:
                    const EdgeInsets.all(6.0), // Adjust the padding as needed
                child: Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: errorName,
                    child: Text(
                      "The name is either too long, too short, or contains invalid characters.",
                      style: errorName
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.v)
            ]));
  }

  onTapCancel(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
