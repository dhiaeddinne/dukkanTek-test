import 'package:dukkan_tekk_test/app/constants/app_theme.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



SnackBar showSuccessSnackBar({required String message}) {
  return SnackBar(content: Text(message),behavior: SnackBarBehavior.floating,);
}

SnackBar showFailureSnackBar({required String message}) {
  return SnackBar(content: Row(
    children: [
      Icon(Icons.error, color: redColor),
      12.horizontalSpace,
      CustomText(text: message,size: 14,)
    ],
  ),dismissDirection: DismissDirection.down,backgroundColor: whiteColor,behavior: SnackBarBehavior.floating,);
}