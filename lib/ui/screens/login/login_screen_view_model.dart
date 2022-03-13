import 'package:dukkan_tekk_test/app/globalization/globalizationManager.dart';
import 'package:dukkan_tekk_test/app/models/exception/lose_connection_exception.dart';
import 'package:dukkan_tekk_test/app/models/social_auth_model.dart';
import 'package:dukkan_tekk_test/app/services/api_client.dart';
import 'package:dukkan_tekk_test/app/services/navigation_services.dart';
import 'package:dukkan_tekk_test/ui/screens/home/home_view.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {

  /// show password variable
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  /// focus Node
  final FocusNode _emailFocusNode = FocusNode();

  FocusNode get emailFocusNode => _emailFocusNode;

  final FocusNode _passwordFocusNode = FocusNode();

  FocusNode get passwordFocusNode => _passwordFocusNode;

  /// TextEditingController
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  ///btnController
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  RoundedLoadingButtonController get btnController => _btnController;

  ///Api client service
  final ApiClient _apiClient = ApiClient();

  ///navigation Servoce
  NavigationService navigationService = NavigationService();

  /// scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  GlobalKey get scaffoldKey => _scaffoldKey;

  /// keyForm key
  final keyForm = GlobalKey<FormState>();


  /// change password visibility
  void changeObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }


  ///Login with Google
  void loginWithGoogle({required BuildContext context}) async{

    try {
      await _apiClient.signInWithGoogle();
      navigationService.changeScreenReplacement(context, const HomeScreenView());
      keyForm.currentState!.reset();
    } on LoseConnectionException catch (e) {
      throw ("LoseConnectionException $LoseConnectionException");
    } catch (e2) {
      throw ("exception $e2");
    }
  }


  ///login with api
  void signIn({required BuildContext context,}) async{
    try {
      await _apiClient.signIn(email: _emailController.text, password: _passwordController.text);
      btnController.success();
      keyForm.currentState!.reset();
      Future.delayed(const Duration(milliseconds: 200)).then((value) =>  btnController.reset());
      Future.delayed(const Duration(milliseconds: 300)).then((value) =>  navigationService.changeScreenReplacement(context, const HomeScreenView()));
    } on LoseConnectionException catch (e) {
      _scaffoldKey.currentState!.showSnackBar(showFailureSnackBar(message: GlobalizationManager.of(context).getMessage("message", "no_internet")));
      Future.delayed(const Duration(milliseconds: 100)).then((value) =>  btnController.reset());
    } catch (e2) {
      _scaffoldKey.currentState!.showSnackBar(showFailureSnackBar(message: GlobalizationManager.of(context).getMessage("message", "login_error")));
      btnController.error();
      Future.delayed(const Duration(milliseconds: 100)).then((value) =>  btnController.reset());
      throw ("exception $e2");
    }
  }

}
