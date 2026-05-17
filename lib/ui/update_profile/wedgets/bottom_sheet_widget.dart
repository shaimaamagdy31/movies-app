import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AppConstants.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/ui/update_profile/wedgets/image_view_item.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(top: 16,right: 16,left: 16),
      margin:REdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.fillColorContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:AppConstants.avatarList.length ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 18.w,
                mainAxisSpacing: 19.w,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context,index)=>ImageViewItem(index: index,isSelected:true,))
        ],
      ),
    );
  }
}
