import 'package:dukkan_tekk_test/ui/screens/home/home_view.dart';
import 'package:dukkan_tekk_test/ui/screens/login/login_screen_view.dart';
import 'package:dukkan_tekk_test/ui/screens/spash_screen/splash_screen_view.dart';
import 'package:dukkan_tekk_test/ui/screens/unknown_screen.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/custom_navigation/slide_left_route.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/custom_navigation/slide_right_route.dart';
import 'package:flutter/material.dart';

const String splashScreenViewRoute = "/";
const String homeScreenRoute = "/home";
const String loginScreenRoute = "/login";
const String registerScreeRoute = "/sign_up";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenViewRoute:
      return MaterialPageRoute(
          builder: (context) => const SplashScreenView());
    case loginScreenRoute:
        return SlideRightRoute(page: const LoginScreenView());
    case homeScreenRoute:
      return SlideRightRoute(page: const HomeScreenView());
    default:
      return SlideLeftRoute(page: const UnknownScreenRoute());
  }
}