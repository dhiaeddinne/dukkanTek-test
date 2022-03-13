import 'package:dukkan_tekk_test/app/constants/app_theme.dart';
import 'package:dukkan_tekk_test/app/globalization/globalizationManager.dart';
import 'package:dukkan_tekk_test/app/validators/emailValidator.dart';
import 'package:dukkan_tekk_test/app/validators/requiredValidator.dart';
import 'package:dukkan_tekk_test/ui/screens/login/login_screen_view_model.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/custom_button.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/custom_text.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              key: model.scaffoldKey,
              // backgroundColor: primaryColor,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(200),
                            ),
                          ),
                        )),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(200),
                            ),
                          ),
                        )),
                    Form(
                      key: model.keyForm,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              150.verticalSpace,
                              CustomText(
                                text: GlobalizationManager.of(context)
                                    .getMessage(
                                        "auth", "login_to_your_account"),
                                size: 28,
                                color: blackColor,
                                weight: FontWeight.bold,
                                textAlign: TextAlign.center,
                              ),
                              40.verticalSpace,
                              emailField(loginViewModel: model, widgetKey: const Key("emailField")),
                              20.verticalSpace,
                              passwordField(loginViewModel: model,widgetKey: const Key("passwordField")),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: GlobalizationManager.of(context)
                                        .getMessage("auth", "forget_password"),
                                    color: blackColor,
                                    size: 15,
                                  )
                                ],
                              ),
                              20.verticalSpace,
                              loginButton(loginViewModel: model),
                              20.verticalSpace,
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    color: dividerColor,
                                    height: 1,
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    child: CustomText(
                                      text: "Or",
                                      color: blackColor,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    color: dividerColor,
                                    height: 1,
                                  ))
                                ],
                              ),
                              20.verticalSpace,
                              loginWithGoogleButton(loginViewModel: model),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget emailField({required LoginViewModel loginViewModel,required Key widgetKey}) {
    /// CustomTextFormField is a custom widget for the textFormField

    return CustomTextFormField(
      widgetKey: widgetKey,
      labelColor: blackColor,
      enabledBorderColor: blackColor,
      focusedBorderColor: blackColor,
      hintTextColor: blackColor,
      textColor: blackColor,
      validator: (value) => EmailValidator.validateEmail(context, value),
      textInputType: TextInputType.emailAddress,
      label: GlobalizationManager.of(context).getMessage("auth", "email"),
      controller: loginViewModel.emailController,
      focusNode: loginViewModel.emailFocusNode,
      hintText: "example@gmail.com",
      onFieldSubmitted: (){
        loginViewModel.passwordFocusNode.requestFocus();

      },
    );
  }

  Widget passwordField({required LoginViewModel loginViewModel, required Key widgetKey}) {
    return CustomTextFormField(
      widgetKey: widgetKey,
      labelColor: blackColor,
      enabledBorderColor: blackColor,
      focusedBorderColor: blackColor,
      hintTextColor: blackColor,
      textColor: blackColor,
      validator: (value) => RequiredValidator.required(context, value),
      label: GlobalizationManager.of(context).getMessage("auth", "password"),
      controller: loginViewModel.passwordController,
      focusNode: loginViewModel.passwordFocusNode,
      obscureText: loginViewModel.obscurePassword,
      suffixIcon: GestureDetector(
          onTap: () {
            loginViewModel.changeObscurePassword();
          },
          child: loginViewModel.obscurePassword
              ? Icon(
                  Icons.visibility_off_outlined,
                  color: blackColor,
                  size: 20,
                )
              : Icon(
                  Icons.visibility,
                  color: blackColor,
                  size: 20,
                )),
    );
  }

  Widget loginButton({required LoginViewModel loginViewModel}) {
    return RoundedLoadingButton(
      color: primaryColor,
      successColor: primaryColor,
      controller: loginViewModel.btnController,
      animateOnTap: false,
      onPressed: () {
        if(loginViewModel
            .keyForm.currentState!.validate()){
          loginViewModel.btnController.start();
          loginViewModel.signIn(
            context: context,
          );
        }
      },
      height: 50,
      valueColor: whiteColor,
      borderRadius: 1,
      child: CustomText(
        color: whiteColor,
        text: GlobalizationManager.of(context).getMessage("auth", "login"),
      ),
    );
    // return CustomButton(
    //     text: GlobalizationManager.of(context).getMessage("auth", "login"),
    //     btnColor: buttonColor,
    //     onTapFunction: () {
    //
    //     });
  }

  Widget loginWithGoogleButton({required LoginViewModel loginViewModel}) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w),
      child: CustomIconButton(
        onTapFunction: () {
          loginViewModel.loginWithGoogle(context: context);
        },
        text: GlobalizationManager.of(context)
            .getMessage("auth", "login_with_google"),
        textColor: blackColor,
        btnIcon: SvgPicture.asset(
          googleIcon,
          height: 25,
        ),
        height: 55,
        btnColor: Colors.transparent,
      ),
    );
  }
}
