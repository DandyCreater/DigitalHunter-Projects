import 'package:digital_hunter/presentation/bloc/carousel-bloc/carousel_bloc.dart';
import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:digital_hunter/presentation/screen/homepage-screen/homepage_screen.dart';
import 'package:digital_hunter/presentation/screen/profilepage-screen/profilepage_screen.dart';
import 'package:digital_hunter/presentation/screen/projectpage-screen/projectpage_screen.dart';
import 'package:digital_hunter/presentation/screen/questpage-screen/questpage_screen.dart';
import 'package:digital_hunter/presentation/screen/rankpage-screen/rankpage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentpage = 0;

  var pages = [
    const HomePageScreen(),
    const ProjectPageScreen(),
    const QuestPageScreen(),
    const RankPageScreen(),
    const ProfilePageScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: pages[_currentpage],
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: ColorManager.backgroundColor,
            child: Container(
              height: 7.h,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: ColorManager.whiteColor, boxShadow: [
                BoxShadow(
                  color: ColorManager.shadowColor,
                  blurRadius: 8,
                  offset: const Offset(2, 2),
                )
              ]),
              child: Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _onTapped(0),
                      child: Column(
                        children: [
                          _currentpage == 0
                              ? Image.asset(
                                  "assets/images/image_home.png",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/icon_home.svg",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Home",
                            style: RobotoRegularThemeText(
                                12,
                                _currentpage == 0
                                    ? ColorManager.activeColor
                                    : ColorManager.inActiveColor),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onTapped(1),
                      child: Column(
                        children: [
                          _currentpage == 1
                              ? Image.asset(
                                  "assets/images/image_projects.png",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/icon_projects.svg",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Project",
                            style: RobotoRegularThemeText(
                                12,
                                _currentpage == 1
                                    ? ColorManager.activeColor
                                    : ColorManager.inActiveColor),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 3.5.h,
                        ),
                        Text(
                          "Quest",
                          style: RobotoRegularThemeText(
                              12,
                              _currentpage == 2
                                  ? ColorManager.activeColor
                                  : ColorManager.inActiveColor),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => _onTapped(3),
                      child: Column(
                        children: [
                          _currentpage == 3
                              ? Image.asset(
                                  "assets/images/image_rank.png",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/icon_crown.svg",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Rank",
                            style: RobotoRegularThemeText(
                                12,
                                _currentpage == 3
                                    ? ColorManager.activeColor
                                    : ColorManager.inActiveColor),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onTapped(4),
                      child: Column(
                        children: [
                          _currentpage == 4
                              ? Image.asset(
                                  "assets/images/image_profile.png",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/icon_profile.svg",
                                  height: 2.5.h,
                                  width: 2.5.h,
                                ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Profile",
                            style: RobotoRegularThemeText(
                                12,
                                _currentpage == 4
                                    ? ColorManager.activeColor
                                    : ColorManager.inActiveColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: () => _onTapped(2),
          child: Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: SizedBox(
              height: 8.h,
              width: 16.w,
              child: ClipPolygon(
                  borderRadius: 5,
                  sides: 6,
                  child: Container(
                    color: ColorManager.primaryColor,
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.2.w, vertical: 2.2.h),
                    child: SvgPicture.asset("assets/icons/icon_quest.svg"),
                  )),
            ),
          ),
        ),
      );
    }));
  }
}
