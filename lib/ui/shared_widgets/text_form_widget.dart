import 'package:dukkan_tekk_test/app/constants/form_utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final FormFieldValidator? validator;
  final Widget? suffixIcon;
  final Function? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool? obscureText;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? textColor;
  final Color? hintTextColor;
  final Color? labelColor;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Key? widgetKey;

  CustomTextFormField(
      {this.validator,
        this.hintText,
        this.enabledBorderColor,
        this.obscureText,
        this.focusedBorderColor,
        this.suffixIcon,
        required this.label,
        this.onFieldSubmitted,
        this.textColor,
        this.hintTextColor,
        this.labelColor,
        this.textInputType,
        this.widgetKey,
        this.focusNode, this.controller,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 66,
      child: TextFormField(
        key: widgetKey,
        focusNode: focusNode,
        controller: controller,
        autofocus: false,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        validator: validator,
        obscureText: obscureText ?? false,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textColor ?? Colors.white),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
            label: Text(label
                .toUpperCase()),
            labelStyle: TextStyle(
              color: labelColor ?? Colors.white38,
              fontSize: 14
            ),
            hintStyle: TextStyle(
              color: textColor ??Colors.white38,
              fontSize: 14
            ),
            hintText: hintText,
            enabledBorder: inInputBorderColor(enabledBorderColor ?? Colors.white),
            focusedBorder: inInputBorderColor(focusedBorderColor?? Colors.white),
            errorBorder: redSignInInputBorder(),
            focusedErrorBorder: redSignInInputBorder(),
            errorStyle: const TextStyle(fontSize: 12)),
        onFieldSubmitted: (value) {
          onFieldSubmitted ??   focusNode?.unfocus();
        },
      ),
    );
  }
}
