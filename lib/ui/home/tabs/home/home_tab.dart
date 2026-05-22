import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/card_item.dart';
import 'package:movies_app/core/utils/AppConstants.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/ui/home/tabs/home/view_model/movies_view_model.dart';
import 'package:movies_app/ui/home/tabs/home/widgets/card2_view.dart';

import '../../../../model/films_response/Movies.dart';

class HomeTab extends StatefulWidget {
   const HomeTab();

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final CarouselSliderController  carouselController= CarouselSliderController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MoviesViewModel()..getAllMovies(AppConstants.dummyData[0]),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AssetsManager.backGroundHome,fit: BoxFit.fill,width: double.infinity
            ,),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ColorsManager.black,
                    ColorsManager.black.withValues(
                        alpha: 0.6
                    ),
                    ColorsManager.black.withValues(
                      alpha: 0.8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(AssetsManager.availableNow),
               CarouselSlider.builder(
                  itemBuilder:(context,itemIndex,pageViewIndex)=> CardView2(),
                  itemCount: 10,
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: 310,
                    onPageChanged: (newPageIndex,reason) {
                      setState(() {
                        currentPage = newPageIndex;
                      });
                    },
                    enlargeCenterPage: true,
                    enlargeFactor: 0.35,
                    viewportFraction: 0.47,
                    initialPage: 1,
                    enableInfiniteScroll: false,
                  ),
                ),
              Image.asset(AssetsManager.watchNow),
              SizedBox(height: 30.h,),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(AppConstants.dummyData[currentPage],style:Theme.of(context).textTheme.bodySmall),
                    Spacer(),
                    Row(
                      children: [
                        Text("See More",style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 16.sp
                        ),),
                        SizedBox(width: 4.w,),
                        Icon(Icons.arrow_forward,color: ColorsManager.yellow,size: 15.sp,),

                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<MoviesViewModel,MoviesState>(
                  builder:(context,state) {
                    switch(state){
                      case MoviesLoadingState():{
                        return Center(child: CircularProgressIndicator(),);
                      }
                      case MoviesErrorState():{
                        return Center(child: Text(state.errorMessage),);
                      }
                      case MoviesSuccessState():{
                        List<Movie> movies = state.movies;
                        if(movies.isEmpty){
                          return Center(child: Text("No Movies found"),);
                        }
                        return Padding(
                          padding: REdgeInsets.only(left: 16,top: 12),
                          child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>CardItem(movie: movies[index]),
                          separatorBuilder:(context,index)=>SizedBox(width: 16.w,) ,
                          itemCount: movies.length
                          ),
                        );
                      }
                    }
                  }
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
/*
Padding(
                    padding: REdgeInsets.only(left: 16,top: 12),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>CardView2(),
                        separatorBuilder:(context,index)=>SizedBox(width: 16.w,) ,
                        itemCount: 20),
                  ),
 */