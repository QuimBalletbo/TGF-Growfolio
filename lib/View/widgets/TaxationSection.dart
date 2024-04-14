import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/widgets/custom_radio_button.dart';

class TaxationSection extends StatefulWidget {
  final String text_1;
  final String text_2;
  final Function(String) onSelectionChanged;
  final String initialSelection;

  TaxationSection({
    Key? key,
    required this.text_1,
    required this.text_2,
    required this.onSelectionChanged,
    this.initialSelection = "",
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
  void initState() {
    super.initState();
    if (widget.initialSelection.isNotEmpty &&
        radioList.contains(widget.initialSelection)) {
      frequencyInvesting = widget.initialSelection;
    }
  }

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
                widget.onSelectionChanged(radioList[0]);
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
                widget.onSelectionChanged(radioList[1]);
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
