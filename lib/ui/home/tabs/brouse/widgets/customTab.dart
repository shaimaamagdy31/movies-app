import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';

class CustomTab extends StatelessWidget {
  final String title;
   CustomTab({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: 19,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.yellow,width: 2.w),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(title,),
    );
  }
}
