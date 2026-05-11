import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/customBtn.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';
import 'package:movies_app/model/onboarding_data.dart';
import 'package:movies_app/ui/onboarding/wedgets/image_view_widget.dart';

class OnboardingScreen extends StatefulWidget {
  static final String routeName = "onboarding_Screen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  int currentPage = 0;
  void nextPage() {
    if (currentPage < OnboardingData.onboardingDataList.length - 1) {
      currentPage++;
      controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      currentPage--;
      controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentGeometry.bottomRight,
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index)=>
                ImageViewWidget(index: index),
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: OnboardingData.onboardingDataList.length,
            ),
            Container(
              padding: REdgeInsets.only(top: 25, bottom: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color: ColorsManager.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.r),
                  topLeft: Radius.circular(40.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    OnboardingData.onboardingDataList[currentPage].title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8.h,),
                  if(OnboardingData.onboardingDataList[currentPage].desc !=null)...[
                  Text(
                    OnboardingData.onboardingDataList[currentPage].desc!,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  ],
                  SizedBox(height: 16.h,),
                  CustomBtn(
                    text:
                        (currentPage ==
                            OnboardingData.onboardingDataList.length - 1)
                        ? StringsManager.finish
                        : StringsManager.next,
                    onPressed: nextPage,
                    colorContainer:Theme.of(context).colorScheme.primary,
                    colorText: Theme.of(context).colorScheme.onPrimary,
                    borderContainer:Colors.transparent,
                  ),
                  SizedBox(height: 14.h,),
                  if (currentPage > 0) ...[
                    CustomBtn(
                      text: StringsManager.back,
                      onPressed: prevPage,
                      colorContainer:Colors.transparent,
                      colorText: Theme.of(context).colorScheme.primary,
                      borderContainer:Theme.of(context).colorScheme.primary,
        
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
