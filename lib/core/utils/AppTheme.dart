import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ColorsManager.dart';

class AppTheme {

 static ThemeData darkTheme=ThemeData(
   scaffoldBackgroundColor:ColorsManager.black,
   appBarTheme: AppBarTheme(
     centerTitle: true,
     backgroundColor: Colors.transparent,
     titleTextStyle: TextStyle(
         fontSize: 16.sp,
         fontWeight: FontWeight.w400,
         color: ColorsManager.yellow
     ),
   ),
   colorScheme: ColorScheme.dark(
     primary: ColorsManager.yellow,
     onPrimary:ColorsManager.black ,
     onPrimaryContainer: ColorsManager.white,
   ),

   textTheme: TextTheme(
     headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.white
     ),
     headlineLarge: TextStyle(
         fontSize: 36.sp,
         fontWeight: FontWeight.w500,
         color: ColorsManager.white

     ),
     bodySmall: TextStyle(
         fontSize: 20.sp,
         fontWeight: FontWeight.w400,
         color: ColorsManager.white,
         height: 1.2.h,

     )




   )








);





}