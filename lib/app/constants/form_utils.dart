import 'package:flutter/material.dart';

InputBorder customSignInInputBorder(Color color) {
  return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(2));
}

InputBorder inInputBorderColor(color) {
  return customSignInInputBorder(color);
}

InputBorder redSignInInputBorder() {
  return customSignInInputBorder(Colors.red);
}
