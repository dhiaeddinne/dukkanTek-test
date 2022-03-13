import 'package:dukkan_tekk_test/app/globalization/globalizationManager.dart';
import 'package:flutter/material.dart';

class EmailValidator {
  static String? validateEmail(BuildContext context, value) {
    if (value.isEmpty) {
      return GlobalizationManager.of(context)
          .getMessage("validationErrors", "requiredField");
    }

    String strValue = value.toString();

    RegExp emailPattern = RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$");

    if (!emailPattern.hasMatch(strValue)) {
      return GlobalizationManager.of(context)
          .getMessage("validationErrors", "invalidEmail");
    }

    return null;
  }
}
