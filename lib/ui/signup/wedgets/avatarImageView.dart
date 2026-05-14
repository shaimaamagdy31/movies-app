import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AppConstants.dart';

class AvatarImageView extends StatefulWidget {
   int index;
   bool isSelected;
   AvatarImageView({required this.index,required this.isSelected});

  @override
  State<AvatarImageView> createState() => _AvatarImageViewState();
}

class _AvatarImageViewState extends State<AvatarImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: widget.isSelected?9:40,
      ),
      child: Image.asset(AppConstants.avatarList[widget.index],
        fit:widget.isSelected? BoxFit.fill:BoxFit.fitHeight,
        ),
    );
  }
}
