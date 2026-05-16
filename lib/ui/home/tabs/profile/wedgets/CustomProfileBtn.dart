import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfileBtn extends StatelessWidget {
  final String text;
  IconData? iconImage;
  final VoidCallback onPressed;
  final Color colorText;
  final Color colorContainer;

  CustomProfileBtn({required this.text,required this.onPressed,required this.colorContainer,required this.colorText,this.iconImage});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed ,
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color:Colors.transparent ),
          borderRadius: BorderRadius.circular(15.r),
          color: colorContainer,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 11.w,
          children:[
            if(iconImage!=null)...[
              Text(text,
                  style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      color: colorText
                  ) ),
              Icon(iconImage),
            ]else
              Text(text,
                  style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      color: colorText
                  ) ),
          ] ,
        ),

      ),
    );
  }
}
