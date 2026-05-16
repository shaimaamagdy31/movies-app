import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/ui/home/tabs/brouse/browse_tab.dart';
import 'package:movies_app/ui/home/tabs/home/home_tab.dart';
import 'package:movies_app/ui/home/tabs/profile/profile_tab.dart';

import '../../../core/utils/AssetsManager.dart';
import '../tabs/search/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Padding(
          padding:  REdgeInsets.only(left: 9,right: 9,bottom: 9),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: BottomNavigationBar(
              backgroundColor:ColorsManager.fillColorContainer ,
                currentIndex: selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index){
                  setState(() {
                    selectedIndex=index;
                  });
                },
                items: [
                 BottomNavigationBarItem(
                  icon:SvgPicture.asset(AssetsManager.homeIcon),
                  activeIcon: SvgPicture.asset(AssetsManager.homeIconSelected),
                   label: ""
                 ),
                  BottomNavigationBarItem(
                      label: "",
                      icon:SvgPicture.asset(AssetsManager.searchIcon),
                      activeIcon: SvgPicture.asset(AssetsManager.searchIconSelected),

                  ),
                  BottomNavigationBarItem(
                      icon:SvgPicture.asset(AssetsManager.browseIcon),
                      activeIcon: SvgPicture.asset(AssetsManager.browseIconSelected),
                      label: ""
                  ),
                  BottomNavigationBarItem(
                      icon:SvgPicture.asset(AssetsManager.profileIcon),
                      activeIcon: SvgPicture.asset(AssetsManager.profileIconSelected),
                      label: ""
                  ),

            ]),
          ),
        )
        ,body:tabs[selectedIndex] ,
      ),
    );
  }
}
