import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/AssetsManager.dart';
import 'package:movies_app/core/utils/ColorsManager.dart';
import 'package:movies_app/core/utils/StringsManager.dart';
import 'package:movies_app/ui/home/tabs/profile/wedgets/CustomProfileBtn.dart';
import 'package:movies_app/ui/home/tabs/profile/wedgets/history_list.dart';
import 'package:movies_app/ui/home/tabs/profile/wedgets/watch_list.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.only(top: 16,left: 16,right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Column(
                      spacing: 15.h,
                      children: [
                        Image.asset(
                          AssetsManager.gamer7,
                          fit: BoxFit.fill,
                          height: 118.h,
                          width: 118.w,
                        ),
                        Text(
                          "John Safwat",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(fontSize: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox(width: 46.w),
                    Column(
                      spacing: 20.h,
                      children: [
                        Text(
                          "10",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(fontSize: 36),
                        ),
                        Text(
                          StringsManager.wishList,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                    SizedBox(width: 38.w),
                    Column(
                      spacing: 20.h,
                      children: [
                        Text(
                          "10",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(fontSize: 36),
                        ),
                        Text(
                          StringsManager.history,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomProfileBtn(
                        text: StringsManager.editProfile,
                        onPressed: () {},
                        colorContainer: ColorsManager.yellow,
                        colorText: ColorsManager.black,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 2,
                      child: CustomProfileBtn(
                        text: StringsManager.exit,
                        onPressed: () {},
                        colorContainer: ColorsManager.red,
                        colorText: ColorsManager.white,
                        iconImage: Icons.exit_to_app,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33.h),
                TabBar(
                    indicatorColor: ColorsManager.yellow,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 20.sp
                    ),
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.list,
                          color:ColorsManager.yellow,
                          size: 44.sp,
                        ),
                        text: StringsManager.watchList,
                      ),
                      Tab(
                        icon: Icon(
                          Icons.folder,
                          color: ColorsManager.yellow,
                          size: 40.sp,
                        ),
                        text: StringsManager.history,
                      ),
                    ]
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: ColorsManager.black,
              padding: REdgeInsets.only(top: 24,left: 16,right: 16),
              child: TabBarView(children: [
                WatchList(),
                HistoryList()
              ]),
            ),
          )
        ],
      ),
    );
  }
}
