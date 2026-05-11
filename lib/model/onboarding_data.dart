import 'dart:ui';

import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';

class OnboardingData {
  String title;
  String? desc;
  String image;
  Color color;

  OnboardingData({
    required this.image,
    required this.title,
    this.desc,
    required this.color,
  });

  static List<OnboardingData> onboardingDataList = [
    OnboardingData(
      title: StringsManager.onBoardingTitle_2,
      desc: StringsManager.onBoardingDesc_2,
      image: AssetsManager.onBoarding_2,
      color: ColorsManager.onBoardingColor_2
    ),
    OnboardingData(
      title: StringsManager.onBoardingTitle_3,
      desc: StringsManager.onBoardingDesc_3,
      image: AssetsManager.onBoarding_3,
      color: ColorsManager.onBoardingColor_3
    ),
    OnboardingData(
      title: StringsManager.onBoardingTitle_4,
      desc: StringsManager.onBoardingDesc_4,
      image: AssetsManager.onBoarding_4,
      color: ColorsManager.onBoardingColor_4
    ),
    OnboardingData(
      title: StringsManager.onBoardingTitle_5,
      desc: StringsManager.onBoardingDesc_5,
      image: AssetsManager.onBoarding_5,
      color: ColorsManager.onBoardingColor_5
    ),
    OnboardingData(
      title: StringsManager.onBoardingTitle_6,
      image: AssetsManager.onBoarding_6,
        color: ColorsManager.onBoardingColor_6
    ),
  ];
}
