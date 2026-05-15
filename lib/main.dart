import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AppTheme.dart';
import 'package:movies_app/ui/forget_password/screen/forget_password_screen.dart';
import 'package:movies_app/ui/signin/screen/signin_screen.dart';
import 'package:movies_app/ui/signup/screen/signup_screen.dart';

void main() {
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
      builder: (cotext , child) {
        return MaterialApp(
          theme: AppTheme.darkTheme,
          title: 'movies app',
          debugShowCheckedModeBanner: false,
          routes:{
            SignupScreen.routeName:(context)=>SignupScreen(),
            SignInScreen.routeName:(context)=>SignInScreen(),
            ForgetPasswordScreen.routeName:(context)=>ForgetPasswordScreen()
          },
          initialRoute:ForgetPasswordScreen.routeName ,
        );
      }
    );
  }
}

