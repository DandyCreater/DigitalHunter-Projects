// ignore_for_file: prefer_const_constructors

import 'package:digital_hunter/presentation/bloc/mission-bloc/mission_bloc.dart';
import 'package:digital_hunter/presentation/resource/color/color_manager.dart';
import 'package:digital_hunter/presentation/resource/font/font_manager.dart';
import 'package:digital_hunter/presentation/widget/questpage-Widget/cardquestWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class QuestPageScreen extends StatefulWidget {
  const QuestPageScreen({Key? key}) : super(key: key);

  @override
  State<QuestPageScreen> createState() => _QuestPageScreenState();
}

class _QuestPageScreenState extends State<QuestPageScreen> {
  var index = 0;
  var countdata = 80;

  TabBar get _tabBar => TabBar(
          indicatorColor: ColorManager.primaryColor,
          labelColor: ColorManager.primaryColor,
          unselectedLabelColor: ColorManager.greyColor,
          indicatorWeight: 0,
          indicator: MD2Indicator(
              indicatorHeight: 4,
              indicatorColor: ColorManager.primaryColor,
              indicatorSize: MD2IndicatorSize.full),
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(
              child: Text(
                "Quest",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeightManager.medium,
                    fontFamily: FontManager.Roboto),
              ),
            ),
            Tab(
              child: Text(
                "Specialize",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeightManager.medium,
                    fontFamily: FontManager.Roboto),
              ),
            )
          ]);

  Widget manualTimeline() => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration:  BoxDecoration(color: ColorManager.inActiveTimeLine),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: countdata.toDouble(),
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.activeColor)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorManager.activeColor, width: 6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "C-CLass",
                    style: RobotoSemiBoldThemeText(12, ColorManager.blackColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "50 Stars",
                    style: RobotoSemiBoldThemeText(12, ColorManager.greyColor),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: (index > 0) ? ColorManager.activeColor : ColorManager.inActiveTimeLine,
                            width: 6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "B-CLass",
                    style: RobotoSemiBoldThemeText(12, ColorManager.blackColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "100 Stars",
                    style: RobotoSemiBoldThemeText(12, ColorManager.greyColor),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: (index > 1) ? ColorManager.activeColor : ColorManager.inActiveTimeLine,
                            width: 6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "A-CLass",
                    style: RobotoSemiBoldThemeText(12, ColorManager.blackColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "150 Stars",
                    style: RobotoSemiBoldThemeText(12, ColorManager.greyColor),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: (index > 2) ? ColorManager.activeColor : ColorManager.inActiveTimeLine,
                            width: 6)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "S-CLass",
                    style: RobotoSemiBoldThemeText(12, ColorManager.blackColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "200 Stars",
                    style: RobotoSemiBoldThemeText(12, ColorManager.greyColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
  Widget quest() => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Progress ",
                style: PoppinsRegularThemeText(15, ColorManager.greyTextColor),
                children: <TextSpan>[
                  TextSpan(
                    text: "80 Stars ",
                    style: PoppinsMediumThemeText(15, ColorManager.blackColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            manualTimeline(),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Misi Utama",
              style: RobotoSemiBoldThemeText(20, ColorManager.blackColor),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 95.h,
              child: BlocBuilder<MissionBloc, MissionState>(
                builder: (context, state) {
                  if (state is MissionSuccess) {
                    var items = state.okContentMission!.items;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items!.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              CardQuestWidget(
                                  title: items[index].title,
                                  star: items[index].star,
                                  coins: items[index].coins,
                                  count: items[index].count,
                                  progress: items[index].progress,
                                  press: () {}),
                              const SizedBox(
                                height: 10,
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
            )
          ],
        ),
      ));

  Widget specialize() => Column();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorManager.whiteColor,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.blackColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Main Quest",
                  style: RobotoMediumThemeText(20, ColorManager.blackColor),
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 1,
                  color: ColorManager.inActiveColor.withOpacity(0.2),
                ))),
                child: _tabBar,
              ),
            ),
          ),
          body: TabBarView(children: [
            quest(),
            specialize(),
          ]),
        ),
      );
    }));
  }
}


// SizedBox(
//               height: 60,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TimelineTile(
//                     axis: TimelineAxis.horizontal,
//                     alignment: TimelineAlign.start,
//                     lineXY: 0.2,
//                     isFirst: true,
//                     beforeLineStyle: LineStyle(color: ColorManager.activeColor),
//                     indicatorStyle: IndicatorStyle(
//                       indicatorXY: 0,
//                       indicator: Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorManager.whiteColor,
//                             border: Border.all(
//                                 color: ColorManager.activeColor, width: 5)),
//                       ),
//                     ),
//                     endChild: Container(
//                       // width: 75,
//                       padding: EdgeInsets.only(
//                         top: 10,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "C-CLass",
//                               style: RobotoSemiBoldThemeText(
//                                   12, ColorManager.blackColor),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "50 Stars",
//                               style: RobotoRegularThemeText(
//                                   12, ColorManager.greyColor),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   TimelineTile(
//                     axis: TimelineAxis.horizontal,
//                     alignment: TimelineAlign.start,
//                     lineXY: 0.2,
//                     afterLineStyle: LineStyle(
//                       color: ColorManager.inActiveTimeLine,
//                     ),
//                     beforeLineStyle: LineStyle(
//                       color: ColorManager.inActiveTimeLine,
//                     ),
//                     indicatorStyle: IndicatorStyle(
//                       indicatorXY: 0,
//                       indicator: Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorManager.whiteColor,
//                             border: Border.all(
//                                 color: ColorManager.inActiveTimeLine,
//                                 width: 5)),
//                       ),
//                     ),
//                     endChild: Container(
//                       color: Colors.amber,
//                       // width: 75,
//                       padding: EdgeInsets.only(top: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "B-CLass",
//                               style: RobotoSemiBoldThemeText(
//                                   12, ColorManager.blackColor),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "100 Stars",
//                               style: RobotoRegularThemeText(
//                                   12, ColorManager.greyColor),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   TimelineTile(
//                     axis: TimelineAxis.horizontal,
//                     alignment: TimelineAlign.start,
//                     lineXY: 0.2,
//                     afterLineStyle: LineStyle(
//                       color: ColorManager.inActiveTimeLine,
//                     ),
//                     beforeLineStyle: LineStyle(
//                       color: ColorManager.inActiveTimeLine,
//                     ),
//                     indicatorStyle: IndicatorStyle(
//                       indicatorXY: 0,
//                       indicator: Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorManager.whiteColor,
//                             border: Border.all(
//                                 color: ColorManager.inActiveTimeLine,
//                                 width: 5)),
//                       ),
//                     ),
//                     endChild: Container(
//                       // width: 75,
//                       padding: EdgeInsets.only(top: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "A-CLass",
//                             style: RobotoSemiBoldThemeText(
//                                 12, ColorManager.blackColor),
//                           ),
//                           Text(
//                             "150 Stars",
//                             style: RobotoRegularThemeText(
//                                 12, ColorManager.greyColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   TimelineTile(
//                     axis: TimelineAxis.horizontal,
//                     alignment: TimelineAlign.start,
//                     lineXY: 0.2,
//                     isLast: true,
//                     indicatorStyle: IndicatorStyle(
//                       indicatorXY: 0,
//                       indicator: Container(
//                         height: 20,
//                         width: 20,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorManager.whiteColor,
//                             border: Border.all(
//                                 color: ColorManager.inActiveTimeLine,
//                                 width: 5)),
//                       ),
//                     ),
//                     endChild: Container(
//                       // width: 75,
//                       padding: EdgeInsets.only(top: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "S-CLass",
//                             style: RobotoSemiBoldThemeText(
//                                 12, ColorManager.blackColor),
//                           ),
//                           Text(
//                             "200 Stars",
//                             style: RobotoRegularThemeText(
//                                 12, ColorManager.greyColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),