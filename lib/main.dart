import 'package:flutter/material.dart';
import 'package:movies_app/ui/onboarding/screen/onboarding_screen.dart';

import 'core/utils/AppTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movies app',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),

      },
      initialRoute:OnboardingScreen.routeName ,
    );
  }
}

