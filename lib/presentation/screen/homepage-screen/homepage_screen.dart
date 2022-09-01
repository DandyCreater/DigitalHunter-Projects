// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_hunter/presentation/bloc/carousel-bloc/carousel_bloc.dart';
import 'package:digital_hunter/presentation/bloc/competition-bloc/competition_bloc.dart';
import 'package:digital_hunter/presentation/bloc/course-bloc/course_bloc.dart';
import 'package:digital_hunter/presentation/bloc/menu-bloc/menu_bloc.dart';
import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:digital_hunter/presentation/resource/routes/route_manager.dart';
import 'package:digital_hunter/presentation/widget/homepage-Widget/competitionWidget.dart';
import 'package:digital_hunter/presentation/widget/homepage-Widget/courseWidget.dart';
import 'package:digital_hunter/presentation/widget/homepage-Widget/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h, left: 3.h, right: 3.h),
                child: RichText(
                  text: TextSpan(
                    text: "Welcome, ",
                    style:
                        PoppinsRegularThemeText(15, ColorManager.greyTextColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: "William Tanuwijaya ",
                        style:
                            PoppinsMediumThemeText(15, ColorManager.blackColor),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 36.h,
                width: double.infinity,
                child: BlocBuilder<CarouselBloc, CarouselState>(
                  builder: (context, state) {
                    if (state is CarouselSuccess) {
                      var items = state.okContentCarousel!.items!.length;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                              itemCount: items,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      pageViewIndex) =>
                                  Container(
                                    margin: EdgeInsets.only(right: 6.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(state
                                              .okContentCarousel!
                                              .items![itemIndex]
                                              .imageUrl
                                              .toString()),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                              options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  viewportFraction: 0.92,
                                  enlargeCenterPage: false,
                                  pauseAutoPlayOnManualNavigate: true,
                                  autoPlay: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  })),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 7.w),
                            child: Row(
                              children: state.okContentCarousel!.items!.map(
                                (image) {
                                  int index = state.okContentCarousel!.items!
                                      .indexOf(image);
                                  return Container(
                                    width: 8,
                                    height: 8,
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 2, right: 2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentIndex == index
                                            ? const Color.fromRGBO(0, 0, 0, 0.9)
                                            : const Color.fromRGBO(
                                                0, 0, 0, 0.4)),
                                  );
                                },
                              ).toList(),
                            ),
                          )
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.shadowColor.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 0))
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/image_user.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                height: 45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hipster",
                                      style: PoppinsSemiBoldThemeText(
                                          20, ColorManager.blackColor),
                                    ),
                                    Text(
                                      "S-Class Digital Talent",
                                      style: PoppinsLightThemeText(
                                          10, ColorManager.greyTextColor),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "157",
                                style: PoppinsSemiBoldThemeText(
                                    20, ColorManager.whiteColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: SvgPicture.asset(
                                    "assets/icons/icon_star.svg"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 100,
                child: BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    if (state is MenuSuccess) {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.okContentMenu!.items!.length,
                          itemBuilder: ((context, index) {
                            
                            var menu = state.okContentMenu!.items;
                            var pressed = "/"+menu![index].title!.toLowerCase();
                            return Row(
                              children: [
                                MenuDashboard(
                                    imageUrl: menu[index].imageUrl.toString(),
                                    title: menu[index].title.toString(),
                                    press: () {
                                    Navigator.pushNamed(context, '$pressed');
                                        
                                    }),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          }));
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kelas Berbasis Role",
                      style:
                          RobotoSemiBoldThemeText(17, ColorManager.blackColor),
                    ),
                    Text(
                      "Lihat Semua",
                      style: RobotoRegularThemeText(14, ColorManager.greyColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 250,
                child: BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state is CourseSuccess) {
                      var items = state.okContentCourse!.items;
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 20),
                          itemCount: items!.length,
                          itemBuilder: ((context, index) {
                            return Row(
                              children: [
                                CourseWidget(
                                  imageUrl: items[index].imageUrl.toString(),
                                  title: items[index].title.toString(),
                                  lessons: items[index].lessons.toString(),
                                  classStatus:
                                      items[index].classStatus.toString(),
                                  subTitle: items[index].subTitle.toString(),
                                  status: items[index].status.toString(),
                                  price: items[index].price.toString(),
                                  poins: items[index].poins.toString(),
                                  student: items[index].poins.toString(),
                                  press: () {},
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            );
                          }));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Competition",
                      style:
                          RobotoSemiBoldThemeText(17, ColorManager.blackColor),
                    ),
                    Text(
                      "Lihat Semua",
                      style: RobotoRegularThemeText(14, ColorManager.greyColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 200,
                child: BlocBuilder<CompetitionBloc, CompetitionState>(
                  builder: (context, state) {
                    if (state is CompetitionSuccess) {
                      var items = state.okContentCompetition!.items;
                      return ListView.builder(
                          padding: const EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: items!.length,
                          itemBuilder: ((context, index) {
                            return Row(
                              children: [
                                CompetitionWidget(
                                  imageUrl: items[index].imageUrl.toString(),
                                  title: items[index].title.toString(),
                                  dayTime: items[index].dayTime.toString(),
                                  nation: items[index].nation.toString(),
                                  status: items[index].status.toString(),
                                  press: () {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            );
                          }));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      );
    }));
  }
}
