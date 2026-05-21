import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AppConstants.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/ui/home/tabs/brouse/widgets/customTab.dart';
import 'package:movies_app/ui/home/tabs/brouse/widgets/films_list.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstants.dummyData.length,
      child: SafeArea(
        bottom: false,
        child:Container(
          color: ColorsManager.black,
          child: Column(
            children:[
              TabBar(
                tabAlignment:TabAlignment.start,
                isScrollable: true,
                dividerColor: Colors.transparent,
                padding: REdgeInsets.only(top: 16,right: 16,left: 16),
                indicator: BoxDecoration(
                  color: ColorsManager.yellow,
                  borderRadius: BorderRadius.circular(16),
                ),
                indicatorPadding: REdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 0,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: ColorsManager.black,
                unselectedLabelColor: ColorsManager.yellow,
                labelPadding: REdgeInsets.symmetric(horizontal:7),
                labelStyle:  TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp
                ),
                tabs:AppConstants.dummyData.map((e)=>CustomTab(title: e)).toList(),
              ),
              Expanded(child: TabBarView(children:AppConstants.dummyData.map((e)=>FilmsList(selectedGenre: e,)).toList())),

            ],
          ),
        ),
      ),
    );
  }
}
