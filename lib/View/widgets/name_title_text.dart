import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';

class NameTitleText extends StatefulWidget {
  final String title; // Added final keyword
  final String name; // Added final keyword

  NameTitleText({
    Key? key,
    required this.title, // Marked as required
    required this.name, // Marked as required
  }) : super(key: key);

  @override
  _NameTitleTextState createState() => _NameTitleTextState();
}

class _NameTitleTextState extends State<NameTitleText> {
  TextEditingController portfolioNameController = TextEditingController();
  String portfolioName = '';

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
              widget.title, // Accessed title via widget
              style: CustomTextStyles.bodyLargeLight,
            ),
          ),
          const SizedBox(height: 9.0),
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: CustomTextFormField(
              width: 228.0,
              controller: portfolioNameController,
              hintText: widget.name, // Accessed name via widget
              hintStyle: CustomTextStyles.headlineSmallMontserrat,
              textInputAction: TextInputAction.done,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL6,
              onEditingComplete: () {
                setState(() {
                  portfolioName = portfolioNameController.text;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
