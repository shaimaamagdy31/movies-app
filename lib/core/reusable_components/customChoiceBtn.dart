import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';

class Customchoicebtn extends StatefulWidget {
  @override
  State<Customchoicebtn> createState() => _CustomchoicebtnState();
}

class _CustomchoicebtnState extends State<Customchoicebtn> {
   int isSelected=0;
  /*
 Customchoicebtn({required this.isSelected});
   */
  Color borderColorChild=Colors.transparent;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 93.w,
      height: 38.h,
      padding: REdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: ColorsManager.yellow,
          width: 2

        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //spacing: 6.w,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                isSelected=0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: isSelected==0?ColorsManager.yellow:Colors.transparent,
                  width: 2
                )
              ),
              child: SvgPicture.asset(AssetsManager.countryLr,
              width: 26.w,height: 26.h,),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                isSelected=1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: isSelected==1?ColorsManager.yellow:Colors.transparent,
                  width: 2
                )
              ),
              child: SvgPicture.asset(AssetsManager.countryEg,
                width: 26.w,height: 26.h,),
            ),
          ),

        ],
      ),
    );
  }
}
