import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';

class NameTitleText extends StatelessWidget {
  final String title;
  final String name;
  final TextEditingController controller;
  final Function(String) onPortfolioNameChanged;

  NameTitleText({
    Key? key,
    required this.title,
    required this.name,
    required this.controller,
    required this.onPortfolioNameChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Text(
              title,
              style: CustomTextStyles.bodyLargeLight,
            ),
          ),
          const SizedBox(height: 9.0),
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: CustomTextFormField(
              width: 228.0,
              controller: controller,
              hintText: name,
              hintStyle: CustomTextStyles.headlineSmallMontserrat,
              textInputAction: TextInputAction.done,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL6,
              onEditingComplete: () {
                onPortfolioNameChanged(
                    controller.text); // Call the callback function
              },
            ),
          ),
        ],
      ),
    );
  }
}
