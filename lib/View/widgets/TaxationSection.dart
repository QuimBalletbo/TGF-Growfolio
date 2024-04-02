import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/widgets/custom_radio_button.dart';

class TaxationSection extends StatefulWidget {
  final String text_1;
  final String text_2;

  TaxationSection({
    Key? key,
    required this.text_1,
    required this.text_2,
  }) : super(key: key);

  @override
  _TaxationSectionState createState() => _TaxationSectionState();
}

class _TaxationSectionState extends State<TaxationSection> {
  List<String> radioList = [
    "Exclude",
    "Include",
  ];
  String frequencyInvesting = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          CustomRadioButton(
            text: widget.text_1,
            value: radioList[0],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value!;
              });
            },
            isRightCheck: frequencyInvesting == radioList[0],
          ),
          SizedBox(height: 10.0),
          CustomRadioButton(
            text: widget.text_2,
            value: radioList[1],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value!;
              });
            },
            isRightCheck: frequencyInvesting == radioList[1],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
