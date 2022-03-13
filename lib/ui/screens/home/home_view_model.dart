import 'package:dukkan_tekk_test/app/constants/app_config.dart';
import 'package:dukkan_tekk_test/app/services/navigation_services.dart';
import 'package:dukkan_tekk_test/ui/screens/login/login_screen_view.dart';
import 'package:dukkan_tekk_test/ui/screens/spash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  NavigationService navigationService = NavigationService();

  /// userData variable
  late final String _userName;

  String get userName => _userName;

  late final String _userEmail;

  String get userEmail => _userEmail;

  void init({required BuildContext context}) async {
    await getUserDataFromLocal();
  }

  /// get user Data from local storage
  getUserDataFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString(userNameKey)!;
    _userEmail = prefs.getString(userEmailKey)!;
    notifyListeners();
  }

  ///Logout
  logout({required BuildContext context}) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    await _googleSignIn.signOut();
    navigationService.pushAndRemove(
        context, const LoginScreenView());
  }
}
