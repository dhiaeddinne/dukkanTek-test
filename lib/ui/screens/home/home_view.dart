import 'package:cached_network_image/cached_network_image.dart';
import 'package:dukkan_tekk_test/ui/screens/home/home_view_model.dart';
import 'package:dukkan_tekk_test/ui/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        onModelReady: (model) => model.init(context: context),
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.verticalSpace,
                    CustomText(text: model.userName),
                    15.verticalSpace,
                    CustomText(text: model.userEmail),
                    15.verticalSpace,
                    IconButton(
                        onPressed: () {
                          model.logout(context: context);
                        },
                        icon: Icon(Icons.exit_to_app))
                  ],
                ),
              ),
            ));
  }
}
