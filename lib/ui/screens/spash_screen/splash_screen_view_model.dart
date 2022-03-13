import 'package:dukkan_tekk_test/app/services/navigation_services.dart';
import 'package:dukkan_tekk_test/ui/screens/login/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {

  NavigationService navigationService = NavigationService();
  
  void init({required BuildContext context}){
    Future.delayed(const Duration(seconds: 2)).then((value) => navigateToHomeScreen(context: context));
  }


  void navigateToHomeScreen({required BuildContext context}) {
    navigationService.changeScreenReplacement(context, const LoginScreenView());
  }
}
