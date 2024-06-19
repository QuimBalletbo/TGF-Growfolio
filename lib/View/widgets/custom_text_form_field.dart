import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.onEditingComplete,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final VoidCallback? onEditingComplete; // Add this line

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.titleLargeff000000,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          onChanged: (value) => onEditingComplete?.call(),
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyLargeLight_1,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(14.h),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appTheme.gray700,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appTheme.gray700,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.h),
              borderSide: BorderSide(
                color: theme.colorScheme.primary.withOpacity(1),
                width: 3,
              ),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlinePrimary => OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlinePrimaryTL10 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide(
          color: theme.colorScheme.primary.withOpacity(1),
          width: 1,
        ),
      );
  static OutlineInputBorder get outlinePrimaryTL101 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide(
          color: theme.colorScheme.primary.withOpacity(1),
          width: 1,
        ),
      );
  static OutlineInputBorder get outlinePrimaryTL102 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlinePrimaryTL18 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlinePrimaryTL6 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide(
          color: theme.colorScheme.primary.withOpacity(1),
          width: 1,
        ),
      );
  static UnderlineInputBorder get underLineDeepOrange => UnderlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.deepOrange200,
        ),
      );
  static OutlineInputBorder get outlinePrimaryTL62 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide(
          color: theme.colorScheme.primary.withOpacity(1),
          width: 1,
        ),
      );
}
