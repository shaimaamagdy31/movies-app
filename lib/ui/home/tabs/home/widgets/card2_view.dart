import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import '../../../../../core/utils/ColorsManager.dart';

class CardView2 extends StatelessWidget {

  const CardView2();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              AssetsManager.film,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: REdgeInsets.only(top: 13, left: 10),
            padding: REdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: ColorsManager.black.withValues(alpha: 0.71),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("7.7"),
                Icon(Icons.star, color: ColorsManager.yellow),
              ],
            ),
          )
        ],
      ),
    );
  }
}
