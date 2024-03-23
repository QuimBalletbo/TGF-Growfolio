import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool? initialValue;
  final Function(bool) onChange;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  CustomSwitch({
    Key? key,
    required this.onChange,
    this.initialValue,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool? _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: widget.margin,
      child: Align(
        alignment: Alignment.center,
        child: CupertinoSwitch(
          value: _value ?? false,
          trackColor: _value ?? false ? Colors.black : Colors.white,
          thumbColor: _value ?? false ? Colors.white : Colors.black,
          activeColor: _value ?? false ? Colors.black : Colors.white,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onChange(value);
          },
        ),
      ),
    );
  }
}
