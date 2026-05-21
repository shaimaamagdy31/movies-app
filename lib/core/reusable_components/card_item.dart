import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/model/films_response/Movies.dart';
import '../utils/ColorsManager.dart';

class CardItem extends StatelessWidget {
  Movie movie;
   CardItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r) ,
            child: CachedNetworkImage(
              imageUrl: movie.largeCoverImage??"",
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error,size: 20.sp,),),
            ),
          ),
          Container(
            margin:REdgeInsets.only(top: 13,left: 10) ,
            padding:REdgeInsets.symmetric(horizontal: 4) ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: ColorsManager.black.withValues(alpha: 0.71),
            ),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(movie.rating.toString()),
                Icon(Icons.star,color: ColorsManager.yellow,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
