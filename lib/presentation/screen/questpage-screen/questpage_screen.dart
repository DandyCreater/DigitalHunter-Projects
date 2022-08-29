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
  TabBar get _tabBar => TabBar(
          indicatorColor: ColorManager.primaryColor,
          labelColor: ColorManager.primaryColor,
          unselectedLabelColor: ColorManager.greyColor,
          indicatorWeight: 0,
          indicator: MD2Indicator(
              indicatorHeight: 4,
              indicatorColor: ColorManager.primaryColor,
              indicatorSize: MD2IndicatorSize.normal),
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(
              child: Text(
                "Aktifitas",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeightManager.medium,
                    fontFamily: FontManager.Roboto),
              ),
            ),
            Tab(
              child: Text(
                "Berita",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeightManager.medium,
                    fontFamily: FontManager.Roboto),
              ),
            )
          ]);

  Widget quest() => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("TimeLine Area"),
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
            Center(child: Text("TimeLine Area")),
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
