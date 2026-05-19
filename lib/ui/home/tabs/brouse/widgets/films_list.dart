import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/card_item.dart';

class FilmsList extends StatelessWidget {
  const FilmsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 16,left: 16,right: 16,bottom:0),
      child: GridView.builder(
        //padding: EdgeInsets.zero,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context,index)=>CardItem()),
    );
  }
}
