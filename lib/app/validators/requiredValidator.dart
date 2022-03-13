import 'package:dukkan_tekk_test/app/globalization/globalizationManager.dart';
import 'package:flutter/material.dart';

class RequiredValidator {
  static String? required(BuildContext context, dynamic value) {
    if (value.isEmpty) {
      return GlobalizationManager.of(context)
          .getMessage("validationErrors", "requiredField");
    }
    return null;
  }
}
