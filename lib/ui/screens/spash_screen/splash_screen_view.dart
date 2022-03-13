import 'package:dukkan_tekk_test/app/constants/app_theme.dart';
import 'package:dukkan_tekk_test/app/globalization/globalizationManager.dart';
import 'package:dukkan_tekk_test/ui/screens/spash_screen/splash_screen_view_model.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';



class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        onModelReady: (model) => model.init(context: context),
        viewModelBuilder: () => SplashScreenViewModel(),
        builder: (context, model, child) => Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: primaryColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  groceryIconImage,
                  height: 300.0,
                  width: 300.0,
                ),
                CustomText(
                  text: GlobalizationManager.of(context)
                      .getMessage("title", "its_time_to_shop"),
                  color: whiteColor,
                  weight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  size: 35,
                ),
                12.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 25.w,right: 25.w),
                  child: CustomText(
                    text: GlobalizationManager.of(context)
                        .getMessage("title", "buy_online"),
                    color: whiteColor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    size: 20,
                  ),
                ),
              ],
            ),

            CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(whiteColor),
            ),
          ],
        ),
      ),
        ));
  }
}
