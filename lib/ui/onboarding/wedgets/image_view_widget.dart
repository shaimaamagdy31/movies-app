import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/model/onboarding_data.dart';

class ImageViewWidget extends StatelessWidget {
  final int index;

  ImageViewWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(OnboardingData.onboardingDataList[index].image,
        height: 620.h,fit:BoxFit.fill,width:double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                OnboardingData.onboardingDataList[index].color,
                OnboardingData.onboardingDataList[index].color.withValues(
                  alpha: 0.0,
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
