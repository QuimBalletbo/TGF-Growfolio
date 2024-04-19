import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';

class EnterTextEuros extends StatefulWidget {
  final String text;
  late String defaultText;
  final TextEditingController controller;
  final Function(String) onTextChanged;
  final String initialSelection;

  EnterTextEuros({
    Key? key,
    required this.text,
    required this.defaultText,
    required this.controller,
    required this.onTextChanged,
    this.initialSelection = "",
  }) : super(key: key);

  @override
  _EnterTextEurosState createState() => _EnterTextEurosState();
}

class _EnterTextEurosState extends State<EnterTextEuros> {
  @override
  void initState() {
    super.initState();
    checkInitialSelection();
  }

  void checkInitialSelection() {
    if (widget.initialSelection.isNotEmpty &&
        widget.initialSelection != "0" &&
        widget.initialSelection != "0.0" &&
        widget.initialSelection != "0.00") {
      widget.defaultText = widget.initialSelection;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the top
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.v, bottom: 8.v),
            child: Container(
              width: 178.h,
              margin: EdgeInsets.only(left: 8.h, right: 15.h),
              child: Text(
                widget.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          Flexible(
            // Wrap the Container with Flexible
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.v),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 1.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.h,
                    ),
                    child: CustomTextFormField(
                      controller: widget.controller,
                      hintText: widget.defaultText,
                      hintStyle: theme.textTheme.bodyMedium!,
                      textInputType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        widget.onTextChanged(widget
                            .controller.text); // Call the callback function
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
