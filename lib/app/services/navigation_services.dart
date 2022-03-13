import 'package:dukkan_tekk_test/ui/shared_widgets/custom_navigation/slide_left_route.dart';
import 'package:flutter/material.dart';

class NavigationService {
  Future changeScreen(BuildContext context, Widget widget) {
    return Navigator.push(
        context, SlideLeftRoute(page: widget));
  }

  void changeScreenReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, SlideLeftRoute(page: widget));
  }

  void pushAndRemove(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
        context, SlideLeftRoute(page: widget),(route) => false);
  }
}