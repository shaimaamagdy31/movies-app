import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AppConstants.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';

class ImageViewItem extends StatelessWidget {
  int index;
  bool isSelected;
  ImageViewItem({required this.isSelected,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isSelected?ColorsManager.yellow.withValues(alpha: 0.56):Colors.transparent,
        border: Border.all(color: ColorsManager.yellow)
      ),
      child:Image.asset(AppConstants.avatarList[index],width: 86.w,height: 86.h,),

    );
  }
}
