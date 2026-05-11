import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/customBtn.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';
import '../onboarding/screen/onboarding_screen.dart';

class StartScreen extends StatelessWidget {
  static final String routeName = "onboarding_Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Image.asset(AssetsManager.onBoarding_1,fit:BoxFit.fill,width: double.infinity,),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(StringsManager.onBoardingTitle_1,style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.center,),
                  SizedBox(height: 16.h,),
                  Text(StringsManager.onBoardingDesc_1,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.6)
                  )),
                  SizedBox(height: 24.h,),
                  CustomBtn(text: StringsManager.exploreNow, onPressed:() {

                  },colorContainer:Theme.of(context).colorScheme.primary,
                    colorText: Theme.of(context).colorScheme.onPrimary,
                    borderContainer:Colors.transparent,)
                ],
              ),
            ),
          )
        ],
      ),

    );

  }


}
