import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/ui/onboarding/screen/onboarding_screen.dart';
import 'package:movies_app/ui/start/start_screen.dart';

import 'core/utils/AppTheme.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (cotext , child){
        return MaterialApp(
          title: 'movies app',
          theme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme,
          routes: {
            OnboardingScreen.routeName: (context) => OnboardingScreen(),
            StartScreen.routeName: (context) => StartScreen(),
          },
          initialRoute:StartScreen.routeName ,
        );
      },
    );
  }
}

