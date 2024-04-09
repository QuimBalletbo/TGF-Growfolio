import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/widgets/custom_radio_button.dart';

class TaxationSectionExtended extends StatefulWidget {
  final String text_1;
  final String text_2;
  final String text_3;
  final String text_4;
  final Function(String) onSelectionChanged;

  TaxationSectionExtended({
    Key? key,
    required this.text_1,
    required this.text_2,
    required this.text_3,
    required this.text_4,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _TaxationSectionExtendedState createState() =>
      _TaxationSectionExtendedState();
}

class _TaxationSectionExtendedState extends State<TaxationSectionExtended> {
  List<String> radioList = [
    "One-time",
    "Monthly",
    "Quarterly",
    "Annual",
  ];
  String frequencyInvesting = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          CustomRadioButton(
            text: widget.text_1,
            value: radioList[0],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value!;
                widget.onSelectionChanged(radioList[0]);
              });
            },
            isRightCheck: frequencyInvesting == radioList[0],
          ),
          const SizedBox(height: 10.0),
          CustomRadioButton(
            text: widget.text_2,
            value: radioList[1],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value!;
                widget.onSelectionChanged(radioList[1]);
              });
            },
            isRightCheck: frequencyInvesting == radioList[1],
          ),
          const SizedBox(height: 10.0),
          CustomRadioButton(
            text: widget.text_3,
            value: radioList[2],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value!;
                widget.onSelectionChanged(radioList[2]);
              });
            },
            isRightCheck: frequencyInvesting == radioList[2],
          ),
          const SizedBox(height: 10.0),
          CustomRadioButton(
            text: widget.text_4,
            value: radioList[3],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value!;
                widget.onSelectionChanged(radioList[3]);
              });
            },
            isRightCheck: frequencyInvesting == radioList[3],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
