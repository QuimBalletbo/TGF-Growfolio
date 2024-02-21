import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/app_export.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  bool? value;

  final Function(bool) onChange;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        child: alignment != null
            ? Align(
                alignment: alignment ?? Alignment.center,
                child: switchWidget,
              )
            : switchWidget);
  }

  Widget get switchWidget => CupertinoSwitch(
        value: value ?? false,
        trackColor: appTheme.whiteA700,
        thumbColor: (value ?? false)
            ? theme.colorScheme.primary.withOpacity(1)
            : theme.colorScheme.primary.withOpacity(1),
        activeColor: appTheme.whiteA700,
        onChanged: (value) {
          onChange(value);
        },
      );
}
